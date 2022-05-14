import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop_app/category/category_menu.dart';
import 'package:e_shop_app/config/config.dart';
import 'package:e_shop_app/model/item.dart';
import 'package:e_shop_app/providers/product_provider.dart';
import 'package:e_shop_app/screens/cart_screen.dart';
import 'package:e_shop_app/screens/search_product_screen.dart';
import 'package:e_shop_app/view_more_screen/category_screen_model.dart';
import 'package:e_shop_app/view_more_screen/page_four_viewmore.dart';
import 'package:e_shop_app/view_more_screen/page_one_viewmore.dart';
import 'package:e_shop_app/view_more_screen/page_three_viewmore.dart';
import 'package:e_shop_app/view_more_screen/page_two_viewmore.dart';
import 'package:e_shop_app/view_more_screen/plant_under_catergory_list.dart';
import 'package:e_shop_app/widgets/colors.dart';
import 'package:e_shop_app/widgets/my_drawer.dart';
import 'package:e_shop_app/widgets/search_box.dart';
import 'package:e_shop_app/widgets/user_home_product_card_widget.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_version/new_version.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

    final newVersion = NewVersion(
      iOSId: 'com.gogreen.plantshop26',
      androidId: 'com.gogreen.plantshop26',
    );

    const simpleBehavior = false;

    if (simpleBehavior) {
      basicStatusCheck(newVersion);
    } else {
      advancedStatusCheck(newVersion);
    }
  }

  basicStatusCheck(NewVersion newVersion) {
    newVersion.showAlertIfNecessary(context: context);
  }

  advancedStatusCheck(NewVersion newVersion) async {
    final status = await newVersion.getVersionStatus();
    if (status != null) {
      debugPrint(status.releaseNotes);
      debugPrint(status.appStoreLink);
      debugPrint(status.localVersion);
      debugPrint(status.storeVersion);
      debugPrint(status.canUpdate.toString());
      newVersion.showUpdateDialog(
        allowDismissal: false,
        context: context,
        versionStatus: status,
        dialogTitle: "Update Your App",
        updateButtonText: "Update App",
        dismissButtonText: "Close App",
        dialogText: "Please Install Latest Version Of The App from Version " +
            status.localVersion +
            " To Version " +
            status.storeVersion,
        dismissAction: () {
          SystemNavigator.pop();
        },
      );

      // ignore: avoid_print
      print("DEVICE : " + status.localVersion);
      // ignore: avoid_print
      print("STORE : " + status.storeVersion);
    }
  }

  @override
  Widget build(BuildContext context) {
//    double width = MediaQuery.of(context).size.width;
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
      drawer: const MyDrawer(),
      body: const HomeMainScreen(),
    );
  }
}

class HomeMainScreen extends StatelessWidget {
  const HomeMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
//    double width = MediaQuery.of(context).size.width;
//    double height = MediaQuery.of(context).size.height;
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: SlideBar()),
        SliverToBoxAdapter(child: CategoryMenu()),
        SliverPersistentHeader(delegate: SearchBoxDelegate()),

        //Recommended

        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("items")
              .where("price", isGreaterThanOrEqualTo: 499)
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
                          child: UserHomeProductCardWidget2(
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
        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("items")
              .where("price", isGreaterThanOrEqualTo: 499)
              .limit(6)
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
                      mainAxisExtent: 180.0,
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
                          child: UserHomeProductCardWidget(
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
        SliverToBoxAdapter(child: PlantUnderMenu()),

        // New in list

        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("items")
              .orderBy("publishedDate", descending: true)
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
                          child: NewInList(
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
        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("items")
              .orderBy("publishedDate", descending: true)
              .limit(6)
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
                      mainAxisExtent: 180.0,
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
                          child: UserHomeProductCardWidget(
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

        // Indoor Plants

        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("items")
              .where("shortInfo", isEqualTo: "Indoor")
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
                          child: YouMayLike(
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
        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("items")
              .where("shortInfo", isEqualTo: "Indoor")
              .limit(6)
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
                      mainAxisExtent: 180.0,
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
                          child: UserHomeProductCardWidget(
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

        //Outdoor Plants

        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("items")
              .where("shortInfo", isEqualTo: "Outdoor")
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
                          child: SuitableForTable(
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
        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("items")
              .where("shortInfo", isEqualTo: "Outdoor")
              .limit(6)
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
                      mainAxisExtent: 180.0,
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
                          child: UserHomeProductCardWidget(
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

        //Pots

        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("items")
              .where("shortInfo", isEqualTo: "Pot")
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
                          child: ChoicesForHOme(
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
        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("items")
              .where("shortInfo", isEqualTo: "Pot")
              .limit(6)
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
                      mainAxisExtent: 180.0,
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
                          child: UserHomeProductCardWidget(
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

        // High Price list

        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("items")
              .where("price", isLessThanOrEqualTo: 99999)
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
                          child: ApartmentSuit(
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
        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("items")
              .where("price", isLessThanOrEqualTo: 99999)
              .orderBy("price", descending: true)
              .limit(16)
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
                      mainAxisExtent: 180.0,
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
                          child: UserHomeProductCardWidget(
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

        // See All Plants

        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("items")
              .where("shortInfo", isNotEqualTo: "Pot")
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
                          child: AllPlantsBar(
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
        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("items")
              .where("shortInfo", isNotEqualTo: "Pot")
              .orderBy("shortInfo", descending: true)
              .limit(30)
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
                      mainAxisExtent: 180.0,
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
                          child: UserHomeProductCardWidget(
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

class SlideBar extends StatefulWidget {
  const SlideBar({Key? key}) : super(key: key);

  @override
  _SlideBarState createState() => _SlideBarState();
}

class _SlideBarState extends State<SlideBar> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 200,
      color: kPrimaryColor.withOpacity(0.1),
      child: CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlay: true,
          ),
          items: [
            InkWell(
              onTap: () {
                Route route =
                    MaterialPageRoute(builder: (c) => const PageOneViewMore());
                Navigator.push(context, route);
              },
              child: FutureBuilder(
                  future:
                      _getImage(context, "/sliderimages/one/homeimageone.jpg"),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height / 1,
                        width: MediaQuery.of(context).size.width / 1,
                        child: snapshot.data,
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 70.0, bottom: 70.0),
                        child: Transform.scale(
                            scale: 0,
                            child: const CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.green),
                            )),
                      );
                    }
                    return Container();
                  }),
            ),
            InkWell(
              onTap: () {
                Route route =
                    MaterialPageRoute(builder: (c) => const PageTwoViewMore());
                Navigator.push(context, route);
              },
              child: FutureBuilder(
                  future:
                      _getImage(context, "/sliderimages/two/homeimagetwo.jpg"),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Container(
                        decoration: BoxDecoration(
                          color: kBackgroundColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        height: MediaQuery.of(context).size.height / 1,
                        width: MediaQuery.of(context).size.width / 1,
                        child: snapshot.data,
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 70.0, bottom: 70.0),
                        child: Transform.scale(
                            scale: 0,
                            child: const CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.green),
                            )),
                      );
                    }
                    return Container();
                  }),
            ),
            InkWell(
              onTap: () {
                Route route = MaterialPageRoute(
                    builder: (c) => const PageThreeViewMore());
                Navigator.push(context, route);
              },
              child: FutureBuilder(
                  future: _getImage(
                      context, "/sliderimages/three/homeimagethree.jpg"),
                  //image three change path
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Container(
                        decoration: BoxDecoration(
                          color: kBackgroundColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        height: MediaQuery.of(context).size.height / 1,
                        width: MediaQuery.of(context).size.width / 1,
                        child: snapshot.data,
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 70.0, bottom: 70.0),
                        child: Transform.scale(
                            scale: 0,
                            child: const CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.green),
                            )),
                      );
                    }
                    return Container();
                  }),
            ),
            InkWell(
              onTap: () {
                Route route =
                    MaterialPageRoute(builder: (c) => const PageFourViewMore());
                Navigator.push(context, route);
              },
              child: FutureBuilder(
                  future: _getImage(
                      context, "/sliderimages/four/homeimagefour.jpg"),
                  //image three change path
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Container(
                        decoration: BoxDecoration(
                          color: kBackgroundColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        height: MediaQuery.of(context).size.height / 1,
                        width: MediaQuery.of(context).size.width / 1,
                        child: snapshot.data,
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 70.0, bottom: 70.0),
                        child: Transform.scale(
                            scale: 0,
                            child: const CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.green),
                            )),
                      );
                    }
                    return Container();
                  }),
            ),
          ]),
    );
  }

  Future<Widget> _getImage(BuildContext context, String imageName) async {
    Image image;
    final value = await FireStorageService.loadImage(context, imageName);
    log(value);
    image = Image.network(
      value.toString(),
      fit: BoxFit.fill,
    );
    return image;
  }
}

class FireStorageService extends ChangeNotifier {
  FireStorageService();

  static Future<String> loadImage(BuildContext context, String image) async {
    return await FirebaseStorage.instance.ref().child(image).getDownloadURL();
  }
}
