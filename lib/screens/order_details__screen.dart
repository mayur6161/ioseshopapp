import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop_app/config/config.dart';
import 'package:e_shop_app/model/address.dart';
import 'package:e_shop_app/model/user_orders_model.dart';
import 'package:e_shop_app/screens/address_screen.dart';
import 'package:e_shop_app/screens/user_orders_history.dart';
import 'package:e_shop_app/widgets/colors.dart';
import 'package:e_shop_app/widgets/loading_widget.dart';
import 'package:e_shop_app/widgets/order_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

String getOrderId = "";
late UserOrdersModel orders;

class OrderDetailsScreen extends StatefulWidget {
  final String orderID;
  final String type;

  const OrderDetailsScreen(
      {Key? key, required this.orderID, required this.type})
      : super(key: key);

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String? userId = '';

  Future<void> userData() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      userId = prefs.getString(EcommerceApp.userUID);
    });
  }

  @override
  void initState() {
    super.initState();
    userData();
  }

  @override
  Widget build(BuildContext context) {
    getOrderId = widget.orderID;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [kPrimaryColor, Colors.green],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
        centerTitle: true,
        title: const Text(
          "My Order Details",
        ),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<DocumentSnapshot>(
          future: widget.type == "userOrder"
              ? FirebaseFirestore.instance
                  .collection(EcommerceApp.collectionUser)
                  .doc(userId)
                  .collection(EcommerceApp.collectionOrders)
                  .doc(widget.orderID)
                  .get()
              : FirebaseFirestore.instance
                  .collection(EcommerceApp.collectionUser)
                  .doc(userId)
                  .collection(EcommerceApp.collectionHistory)
                  .doc(widget.orderID)
                  .get(),
          builder: (c, snapshot) {
            if (snapshot.hasData) {
              orders = UserOrdersModel.fromJson(
                  snapshot.data!.data()! as Map<String, dynamic>);
            }
            if (snapshot.hasData) {
              return Column(
                children: [
                  StatusBanner(
                    status: orders.isSuccess,
                    type: widget.type,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Text(
                          "₹ " + orders.totalAmount.toString(),
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Text("Payment Type :" + orders.paymentDetails),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Text("Order ID: " + getOrderId),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      widget.type == "userOrder"
                          ? "Ordered at: " +
                              DateFormat("dd MMMM, yyyy - hh:mm aa").format(
                                  DateTime.fromMillisecondsSinceEpoch(
                                      int.parse(orders.orderTime)))
                          : "Delivered at: " +
                              DateFormat("dd MMMM, yyyy - hh:mm aa").format(
                                  DateTime.fromMillisecondsSinceEpoch(
                                      int.parse(orders.orderTime))),
                      style:
                          const TextStyle(color: Colors.grey, fontSize: 16.0),
                    ),
                  ),
                  const Divider(
                    height: 2.0,
                  ),
                  OrderCardWidget(
                    orderID: widget.orderID,
                    orderLength: orders.productIDs.length,
                    productIds: orders.productIDs,
                    type: "history",
                  ),
                  const Divider(
                    height: 2.0,
                  ),
                  FutureBuilder<DocumentSnapshot>(
                    future: FirebaseFirestore.instance
                        .collection(EcommerceApp.collectionUser)
                        .doc(userId)
                        .collection(EcommerceApp.subCollectionAddress)
                        .doc(orders.addressID)
                        .get(),
                    builder: (c, snap) {
                      return snap.hasData
                          ? ShippingDetails(
                              model: AddressModel.fromJson(
                                  snap.data!.data() as Map<String, dynamic>),
                              type: widget.type,
                            )
                          : Center(
                              child: circularProgress(),
                            );
                    },
                  ),
                ],
              );
            } else {
              return Center(
                child: circularProgress(),
              );
            }
          },
        ),
      ),
    );
  }
}

class StatusBanner extends StatelessWidget {
  final bool status;
  final String type;

  const StatusBanner({Key? key, required this.status, required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String msg;
    IconData iconData;

    status ? iconData = Icons.done : iconData = Icons.cancel;
    status ? msg = "Successful" : msg = "UnSuccessful";

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [kPrimaryColor, Colors.green],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      height: 40.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            type == "userOrder"
                ? "Order Placed " + msg
                : "Order Delivered " + msg,
            style: const TextStyle(color: kBackgroundColor),
          ),
          const SizedBox(
            width: 5.0,
          ),
          CircleAvatar(
            radius: 8.0,
            backgroundColor: Colors.grey,
            child: Center(
              child: Icon(
                iconData,
                color: kBackgroundColor,
                size: 14.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ShippingDetails extends StatelessWidget {
  final AddressModel model;
  final String type;

  const ShippingDetails({Key? key, required this.model, required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20.0,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.0,
          ),
          child: Text(
            "Shipment Details:",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 5.0),
          width: screenWidth,
          child: Table(
            children: [
              TableRow(children: [
                const KeyText(
                  msg: "Name",
                ),
                Text(model.name),
              ]),
              TableRow(children: [
                const KeyText(
                  msg: "Phone Number",
                ),
                Text(model.phoneNumber),
              ]),
              TableRow(children: [
                const KeyText(
                  msg: "Flat Number",
                ),
                Text(model.flatNumber),
              ]),
              TableRow(children: [
                const KeyText(
                  msg: "Landmark",
                ),
                Text(model.landmark),
              ]),
              TableRow(children: [
                const KeyText(
                  msg: "Address Line 2",
                ),
                Text(model.addressline2),
              ]),
              TableRow(children: [
                const KeyText(
                  msg: "City",
                ),
                Text(model.city),
              ]),
              TableRow(children: [
                const KeyText(
                  msg: "State",
                ),
                Text(model.state),
              ]),
              TableRow(children: [
                const KeyText(
                  msg: "Pin Code",
                ),
                Text(model.pincode),
              ]),
            ],
          ),
        ),
        Container(
          height: 1.0,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(50.0),
            ),
            gradient: LinearGradient(
              colors: [kPrimaryColor, Colors.green],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
          child: Center(
            child: type == "userOrder"
                ? InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                title: const Text('Confirm Order Received'),
                                content: TextButton(
                                  onPressed: () {
                                    confirmedUserOrderReceived(
                                        context, getOrderId);
                                  },
                                  child: const Text(
                                    "Yes Received",
                                    style: TextStyle(
                                        fontSize: 18, color: kPrimaryColor),
                                  ),
                                ),
                              ));
                    },
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 10.0,
                            right: 10.0,
                            top: 10.0,
                          ),
                          child: Center(
                            child: Text(
                              "If you have Received your order",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                              left: 10.0, right: 10.0, bottom: 5.0),
                          child: Center(
                            child: Text(
                              "please confirm.",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(50.0),
                            ),
                            gradient: LinearGradient(
                              colors: [kPrimaryColor, Colors.green],
                              begin: FractionalOffset(0.0, 0.0),
                              end: FractionalOffset(1.0, 0.0),
                              stops: [0.0, 1.0],
                              tileMode: TileMode.clamp,
                            ),
                          ),
                          width: MediaQuery.of(context).size.width - 40.0,
                          height: 50.0,
                          child: const Center(
                            child: Text(
                              "Confirm Order Received",
                              style: TextStyle(
                                color: kBackgroundColor,
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : null,
          ),
        ),
        Container(
          height: 50,
        )
      ],
    );
  }

  confirmedUserOrderReceived(BuildContext context, String mOrderId) async {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    String? userId = '';

    final SharedPreferences prefs = await _prefs;
    List<Map<String, dynamic>> data = [];
    orders.productIDs.forEach((element) {
      data.add({
        "title": element.title,
        "shortInfo": element.shortInfo,
        "publishedDate": element.publishedDate,
        "thumbnailUrl": element.thumbnailUrl,
        "longDescription": element.longDescription,
        "status": element.status,
        "price": element.price,
        "productId": element.productId,
        "itemCount": element.itemCount
      });
    });

    userId = prefs.getString(EcommerceApp.userUID);
    await FirebaseFirestore.instance
        .collection(EcommerceApp.collectionUser)
        .doc(userId)
        .collection(EcommerceApp.collectionOrders)
        .doc(mOrderId)
        .delete()
        .then((value) {
      writeOrderDetailsForHistory({
        EcommerceApp.addressID: orders.addressID,
        EcommerceApp.totalAmount: orders.totalAmount,
        "orderBy": userId,
        EcommerceApp.productData: data,
        EcommerceApp.paymentDetails: orders.paymentDetails == "Cash on Delivery"
            ? "${orders.paymentDetails} Completed"
            : "Online Payment Done",
        EcommerceApp.orderTime:
            DateTime.now().millisecondsSinceEpoch.toString(),
        EcommerceApp.isSuccess: true,
      }, userId!)
          .then((value) {
        writeOrderDetailsForAdmin({
          EcommerceApp.paymentDetails: orders.paymentDetails,
          EcommerceApp.orderTime: orders.orderTime,
        }, userId!);
      }).then((value) {
        Fluttertoast.showToast(msg: "Order has been Received. Confirmed.")
            .whenComplete(() {
          Route route =
              MaterialPageRoute(builder: (c) => const UserOrdersHistory());
          Navigator.pushReplacement(context, route);
        });
      });
    });
  }

  Future writeOrderDetailsForHistory(
      Map<String, dynamic> data, String userId) async {
    await FirebaseFirestore.instance
        .collection(EcommerceApp.collectionUser)
        .doc(userId)
        .collection(EcommerceApp.collectionHistory)
        .doc(userId + data['orderTime'])
        .set(data);
  }

  Future writeOrderDetailsForAdmin(
      Map<String, dynamic> data, String userId) async {
    print(userId + data['orderTime']);
    await FirebaseFirestore.instance
        .collection(EcommerceApp.collectionOrders)
        .doc(userId + data['orderTime'])
        .update({
      EcommerceApp.paymentDetails:
          data[EcommerceApp.paymentDetails] == "Cash on Delivery"
              ? "${data[EcommerceApp.paymentDetails]} Completed"
              : "Online Payment Done",
    });
  }
}
