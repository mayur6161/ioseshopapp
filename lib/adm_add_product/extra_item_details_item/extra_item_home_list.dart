import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop_app/model/item.dart';
import 'package:e_shop_app/widgets/colors.dart';
import 'package:e_shop_app/widgets/loading_widget.dart';
import 'package:flutter/material.dart';

import 'extra_item_home_cardwidget.dart';

class ExtraItemDisplayListScreen extends StatefulWidget {
  const ExtraItemDisplayListScreen({Key? key}) : super(key: key);

  @override
  State<ExtraItemDisplayListScreen> createState() =>
      _ExtraItemDisplayListScreenState();
}

class _ExtraItemDisplayListScreenState extends State<ExtraItemDisplayListScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text('Extra Item Display Screen'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("ExtraItemDisplay")
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
                      return extraItemDisplayScreenWidget(
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
