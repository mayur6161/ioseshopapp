import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:e_shop_app/widgets/colors.dart';

import '../category/category_menu.dart';
import '../model/item.dart';
import '../screens/home_screen.dart';
import '../view_more_screen/category_screen_model.dart';
import '../view_more_screen/plant_under_catergory_list.dart';
import '../widgets/search_box.dart';
import '../widgets/user_home_product_card_widget.dart';
import 'ios_card.dart';
import 'ios_category.dart';
import 'ios_slidebar.dart';
import 'ios_topbar.dart';

// ios menu screen without login

class IosMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: IosSlideBar()),
          SliverToBoxAdapter(child: IosCategoryMenu()),
          SliverPersistentHeader(delegate: SearchBoxDelegate()),

          //Recommended //==========================================================

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
                            child: IosUserHomeProductCardWidget2(
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
                            child: IosUserHomeProductCardWidget(
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

          // New in list  ===================================================

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
                            child: IosNewInList(
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
                            child: IosUserHomeProductCardWidget(
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
        ],
      ),
    );
  }
}
