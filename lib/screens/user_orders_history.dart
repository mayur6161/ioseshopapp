import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop_app/config/config.dart';
import 'package:e_shop_app/model/user_orders_model.dart';
import 'package:e_shop_app/widgets/colors.dart';
import 'package:e_shop_app/widgets/loading_widget.dart';
import 'package:e_shop_app/widgets/order_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserOrdersHistory extends StatefulWidget {
  const UserOrdersHistory({Key? key}) : super(key: key);

  @override
  State<UserOrdersHistory> createState() => _UserOrdersHistoryState();
}

class _UserOrdersHistoryState extends State<UserOrdersHistory> {
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
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "My Orders History",
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection(EcommerceApp.collectionUser)
            .doc(userId)
            .collection(EcommerceApp.collectionHistory)
            .snapshots(),
        builder: (c, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (c, index) {
                    UserOrdersModel orders = UserOrdersModel.fromJson(
                        snapshot.data!.docs[index].data()!
                            as Map<String, dynamic>);

                    return snapshot.hasData
                        ? OrderCardWidget(
                            orderID: snapshot.data!.docs[index].id,
                            orderLength: orders.productIDs.length,
                            productIds: orders.productIDs,
                            type: "userOrderHistory",
                          )
                        : Center(
                            child: circularProgress(),
                          );
                  },
                )
              : Center(
                  child: circularProgress(),
                );
        },
      ),
    );
  }
}
