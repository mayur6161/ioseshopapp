import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop_app/category/category_menu.dart';
import 'package:e_shop_app/config/config.dart';
import 'package:e_shop_app/model/item.dart';
import 'package:e_shop_app/providers/product_provider.dart';
import 'package:e_shop_app/screens/cart_screen.dart';
import 'package:e_shop_app/screens/search_product_screen.dart';
import 'package:e_shop_app/view_more_screen/category_screen_model.dart';
import 'package:e_shop_app/view_more_screen/view_more_screen.dart';
import 'package:e_shop_app/widgets/colors.dart';
import 'package:e_shop_app/widgets/loading_widget.dart';
import 'package:e_shop_app/widgets/my_drawer.dart';
import 'package:e_shop_app/widgets/search_box.dart';
import 'package:e_shop_app/widgets/user_home_product_card_widget.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class ViewMore extends StatefulWidget {
  const ViewMore({Key? key}) : super(key: key);

  @override
  State<ViewMore> createState() => _ViewMoreState();
}

class _ViewMoreState extends State<ViewMore> {
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
    userData().then((value) {
      Provider.of<ProductProvider>(context, listen: false)
          .getFavourite(userId!);
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
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
        title: Column(
          children: const [
            Text(
              "Go Green",
              style: TextStyle(fontFamily: 'SFCMed', fontSize: 22),
            ),
            Text(
              'Plant Shop',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        backgroundColor: kPrimaryColor,
        elevation: 0,
        actions: [
          Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {
                  Route route = MaterialPageRoute(
                      builder: (c) => const SearchProductScreen());
                  Navigator.push(context, route);
                },
              ),
              Stack(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Route route =
                          MaterialPageRoute(builder: (c) => const CartScreen());
                      Navigator.push(context, route);
                    },
                  ),
                  Positioned(
                    child: Stack(
                      children: [
                        const Icon(
                          Icons.brightness_1,
                          size: 20.0,
                          color: kPrimaryColor,
                        ),
                        StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection("users")
                                .doc(userId)
                                .collection("cart")
                                .snapshots(),
                            builder: (ctx, snap) {
                              if (!snap.hasData) {
                                return const CircularProgressIndicator();
                              } else {
                                return Positioned(
                                  top: 3.0,
                                  bottom: 4.0,
                                  left: 4.0,
                                  child: Text(
                                    (snap.data!.docs.length).toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                );
                              }
                            })
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      body: const ViewMoreScreen(),
    );
  }
}

class ViewMoreScreen extends StatelessWidget {
  const ViewMoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: CategoryMenu()),
        SliverPersistentHeader(delegate: SearchBoxDelegate()),
        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("items")
              .where("price", isGreaterThanOrEqualTo: 499 )
              .limit(1)
              .snapshots(),
          builder: (context, dataSnapshot) {
            return !dataSnapshot.hasData
                ? SliverToBoxAdapter(
                    child: Center(
                      child: Transform.scale(
                        scale: 0,
                        child: const CircularProgressIndicator(),
                      ),
                    ),
                  )
                : SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (ctx, index) {
                        ItemModel model = ItemModel.fromJson(
                            dataSnapshot.data!.docs[index].data()!
                                as Map<String, dynamic>);
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DiscoverBar(),
                        );
                      },
                      childCount: dataSnapshot.data!.docs.length,
                    ),
                  );
          },
        ),
        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("items")
              .where("price", isGreaterThanOrEqualTo: 499 )
              .snapshots(),
          builder: (context, dataSnapshot) {
            return !dataSnapshot.hasData
                ? SliverToBoxAdapter(
                    child: Center(
                      child: Transform.scale(
                        scale: 0,
                        child: const CircularProgressIndicator(),
                      ),
                    ),
                  )
                : SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: 180,
                      crossAxisCount: 2,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 0,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (ctx, index) {
                        ItemModel model = ItemModel.fromJson(
                            dataSnapshot.data!.docs[index].data()!
                                as Map<String, dynamic>);
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: PriceUserHomeProductCardWidget(
                              itemModel: model,
                              context: context,
                              productId: dataSnapshot.data!.docs[index].id),
                        );
                      },
                      childCount: dataSnapshot.data!.docs.length,
                    ),
                  );
          },
        ),
        SliverToBoxAdapter(
          child: Container(height: 30),
        ),
      ],
    );
  }
}
