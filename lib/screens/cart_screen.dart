import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop_app/config/config.dart';
import 'package:e_shop_app/model/cart_model.dart';
import 'package:e_shop_app/providers/cart_provider.dart';
import 'package:e_shop_app/screens/address_screen.dart';
import 'package:e_shop_app/widgets/cart_product_card.dart';
import 'package:e_shop_app/widgets/colors.dart';
import 'package:e_shop_app/widgets/loading_widget.dart';
import 'package:e_shop_app/widgets/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  List<String>? cartList = [];
  double totalAmount = 0;
  String? userId = '1';
  List<CartModel> productCount = [];

  Future<void> userData() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      userId = prefs.getString(EcommerceApp.userUID);
      cartList = prefs.getStringList(EcommerceApp.userCartList);
    });
  }

  @override
  void initState() {
    super.initState();
    userData();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
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
          "Cart",
          style: TextStyle(fontSize: 22),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30.0),
        child: Container(
          width: width,
          height: 55,
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
          child: FloatingActionButton.extended(
            onPressed: () async {
              final SharedPreferences prefs = await _prefs;
              if (prefs.getStringList(EcommerceApp.userCartList)!.isEmpty) {
                Fluttertoast.showToast(msg: "your Cart is empty.");
              } else {
                Route route = MaterialPageRoute(
                    builder: (c) => AddressScreen(
                          totalAmount: totalAmount,
                          productCount: productCount,
                          buyType: "cart",
                        ));
                Navigator.push(context, route);
              }
            },
            label: const Text(
              "Check Out",
              style: TextStyle(fontSize: 16),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            icon: const Icon(Icons.navigate_next),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: CustomScrollView(
        slivers: [
          cartList == null
              ? SliverToBoxAdapter(
                  child: Container(),
                )
              : SliverToBoxAdapter(
                  child: Consumer<CartProvider>(
                    builder: (context, cartProvider, c) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: cartList!.isEmpty
                              ? Container()
                              : Text(
                                  "Total Price: ₹ ${cartProvider.totalAmount.toString()}",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w500),
                                ),
                        ),
                      );
                    },
                  ),
                ),
          userId == "1"
              ? const SliverToBoxAdapter(child: CircularProgressIndicator())
              : StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("users")
                      .doc(userId)
                      .collection("cart")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return SliverToBoxAdapter(
                        child: Center(
                          child: circularProgress(),
                        ),
                      );
                    } else {
                      if (snapshot.data!.docs.isEmpty) {
                        WidgetsBinding.instance!.addPostFrameCallback((t) {
                          Provider.of<CartProvider>(context, listen: false)
                              .display(0);
                        });
                      }
                      return SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            CartModel model = CartModel.fromJson(
                                snapshot.data!.docs[index].data()
                                    as Map<String, dynamic>);

                            productCount.add(model);
                            if (index == 0) {
                              totalAmount = 0;
                              totalAmount =
                                  (model.price * model.itemCount) + totalAmount;
                            } else {
                              totalAmount =
                                  (model.price * model.itemCount) + totalAmount;
                            }
                            if (snapshot.data!.docs.length - 1 == index) {
                              WidgetsBinding.instance!
                                  .addPostFrameCallback((t) {
                                Provider.of<CartProvider>(context,
                                        listen: false)
                                    .display(totalAmount);
                              });
                            }

                            return cartProductCard(
                                snapshot.data!.docs[index].id,
                                model.productId,
                                userId!,
                                model,
                                context,
                                width);
                          },
                          childCount:
                              snapshot.hasData ? snapshot.data!.docs.length : 0,
                        ),
                      );
                    }
                  },
                ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 100,
              width: width,
            ),
          ),
        ],
      ),
    );
  }
}
