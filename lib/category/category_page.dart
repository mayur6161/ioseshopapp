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

import 'category_list_page.dart';

class CatergoryPage extends StatefulWidget {
  const CatergoryPage({Key? key}) : super(key: key);

  @override
  State<CatergoryPage> createState() => _CatergoryPageState();
}

class _CatergoryPageState extends State<CatergoryPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        print('The user tries to pop()');
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Route route = MaterialPageRoute(builder: (c) => Category_list());
              Navigator.pushReplacement(context, route);
            },
          ),
          title: const Text('Category Page'),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("items_category")
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
      ),
    );
  }
}
