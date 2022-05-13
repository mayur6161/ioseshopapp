import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop_app/Admin/add_product_screen.dart';
import 'package:e_shop_app/adm_add_product/Apartment_product/product_for_apartment_cardwidget.dart';
import 'package:e_shop_app/adm_add_product/productforhome/product_for_home_cardwidget.dart';
import 'package:e_shop_app/category/add_product_screen_catergory.dart';
import 'package:e_shop_app/main.dart';
import 'package:e_shop_app/model/item.dart';
import 'package:e_shop_app/widgets/admin_product_card_widget.dart';
import 'package:e_shop_app/widgets/colors.dart';
import 'package:e_shop_app/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductForApartmentListScreen extends StatefulWidget {
  const ProductForApartmentListScreen({Key? key}) : super(key: key);

  @override
  State<ProductForApartmentListScreen> createState() =>
      _ProductForApartmentListScreenState();
}

class _ProductForApartmentListScreenState extends State<ProductForApartmentListScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text('Product For Apartment list'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("ProductForApartment")
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
                return productForApartmentScreenWidget(
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
