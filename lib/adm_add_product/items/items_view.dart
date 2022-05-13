import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop_app/Admin/add_product_screen.dart';
import 'package:e_shop_app/category/add_product_screen_catergory.dart';
import 'package:e_shop_app/main.dart';
import 'package:e_shop_app/model/item.dart';
import 'package:e_shop_app/widgets/admin_product_card_widget.dart';
import 'package:e_shop_app/widgets/colors.dart';
import 'package:e_shop_app/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ViewAllItems extends StatefulWidget {
  const ViewAllItems({Key? key}) : super(key: key);

  @override
  State<ViewAllItems> createState() => _ViewAllItemsState();
}

class _ViewAllItemsState extends State<ViewAllItems> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('View All Items'),
        backgroundColor: kPrimaryColor,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("items")
            .orderBy("publishedDate")
            .snapshots(),
        builder: (c, snapshot) {
          return snapshot.hasData
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (c, index) {
                      ItemModel model = ItemModel.fromJson(
                          snapshot.data!.docs[index].data()!
                              as Map<String, dynamic>);
                      return adminProductCardWidget(
                          model, context, snapshot.data!.docs[index].id);
                    },
                  ),
                )
              : Center(
                  child: circularProgress(),
                );
        },
      ),
    );
  }
}
