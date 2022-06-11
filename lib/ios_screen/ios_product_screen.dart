import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop_app/authentication/authenticate_screen.dart';
import 'package:e_shop_app/authentication/register_screen.dart';
import 'package:e_shop_app/category/category_menu.dart';
import 'package:e_shop_app/config/config.dart';
import 'package:e_shop_app/model/cart_model.dart';
import 'package:e_shop_app/model/item.dart';
import 'package:e_shop_app/providers/cart_provider.dart';
import 'package:e_shop_app/providers/product_provider.dart';
import 'package:e_shop_app/screens/address_screen.dart';
import 'package:e_shop_app/screens/search_product_screen.dart';
import 'package:e_shop_app/view_more_screen/category_screen_model.dart';
import 'package:e_shop_app/view_more_screen/plant_under_catergory_list.dart';
import 'package:e_shop_app/widgets/colors.dart';
import 'package:e_shop_app/widgets/search_box.dart';
import 'package:e_shop_app/widgets/user_home_product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_number_picker/flutter_number_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IosProductDetailsScreen extends StatefulWidget {
  final ItemModel itemModel;
  final String productId;

  const IosProductDetailsScreen(
      {Key? key, required this.itemModel, required this.productId})
      : super(key: key);

  @override
  State<IosProductDetailsScreen> createState() =>
      _IosProductDetailsScreenState();
}

class _IosProductDetailsScreenState extends State<IosProductDetailsScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String? userId = '';
  List<String>? cartList = [];
  int itemCount = 1;
  bool onPressedValue = true;

  Future<void> userData() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      userId = prefs.getString(EcommerceApp.userUID);
      cartList = prefs.getStringList(EcommerceApp.userCartList);
    });
  }

  _disabledButton() {
    onPressedValue = false;
    Timer(const Duration(seconds: 1), () => onPressedValue = true);
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
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: kPrimaryColor,
    ));
    return Container(
      color: kPrimaryColor,
      child: SafeArea(
        child: Scaffold(
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
                ],
              ),
            ],
          ),
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Padding(
                        padding:
                            EdgeInsets.only(left: 20.0, bottom: 12, top: 15.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Product Details",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: "SFCMed",
                                color: kTextColor),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 220,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                          child: CarouselSlider.builder(
                            itemCount: widget.itemModel.thumbnailUrl.length,
                            itemBuilder: (BuildContext context, int itemIndex,
                                    int pageViewIndex) =>
                                Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: CachedNetworkImageProvider(widget
                                          .itemModel.thumbnailUrl[itemIndex]),
                                      fit: BoxFit.fill)),
                            ),
                            options: CarouselOptions(
                              viewportFraction: 0.8,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: false,
                              autoPlayInterval: const Duration(seconds: 5),
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 5.0,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      widget.itemModel.title,
                                      style: const TextStyle(fontSize: 21),
                                    ),
                                    Consumer<ProductProvider>(
                                        builder: (ctx, data, _) {
                                      return IconButton(
                                          onPressed: () {
                                            data.favouriteUpdate(
                                                userId!,
                                                Provider.of<ProductProvider>(
                                                        context,
                                                        listen: false)
                                                    .wishListModel
                                                    .where((element) =>
                                                        element.productId ==
                                                        widget.productId)
                                                    .isNotEmpty,
                                                widget.itemModel,
                                                widget.productId);
                                          },
                                          icon: Icon(
                                            Icons.favorite,
                                            color: data.wishListModel
                                                    .where((element) =>
                                                        element.productId ==
                                                        widget.productId)
                                                    .isNotEmpty
                                                ? kPrimaryColor
                                                : Colors.grey,
                                          ));
                                    }),
                                  ],
                                ),
                              ),
                              Text(
                                "₹ " + widget.itemModel.price.toString(),
                                style: const TextStyle(fontSize: 19),
                              ),
                            ],
                          ),
                        ),
                      ),
                      CustomNumberPicker(
                        valueTextStyle: const TextStyle(fontSize: 18),
                        initialValue: 1,
                        maxValue: 10,
                        minValue: 1,
                        step: 1,
                        onValue: (value) {
                          itemCount = int.parse(value.toString());
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AuthenticateScreen(),
                                ),
                              );
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50.0),
                                ),
                                gradient: LinearGradient(
                                  colors: [Colors.green, kPrimaryColor],
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
                                  "Register To Buy",
                                  style: TextStyle(
                                      color: kBackgroundColor, fontSize: 16.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 20.0, right: 20.0, bottom: 5.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Description",
                            style:
                                TextStyle(fontSize: 19.5, fontFamily: "SFCMed"),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, bottom: 10.0, top: 10.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.itemModel.longDescription,
                            style: const TextStyle(fontSize: 16.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Container(height: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
