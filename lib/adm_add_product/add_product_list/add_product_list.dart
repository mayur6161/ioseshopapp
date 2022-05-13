import 'package:e_shop_app/Admin/add_product_screen.dart';
import 'package:e_shop_app/adm_add_product/add_product_list/view_product_colum.dart';
import 'package:e_shop_app/adm_add_product/productforhome/product_for_home.dart';
import 'package:e_shop_app/adm_add_product/productforhome/product_for_home_list.dart';
import 'package:e_shop_app/widgets/colors.dart';
import 'package:flutter/material.dart';

import '../items/items_view.dart';
import 'add_product_column.dart';

class AddProductListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product List Page"),
        backgroundColor: kPrimaryColor,
      ),
      body: Row(
        children: [
          AddProduct(width: width),
          ViewProduct(width: width),
        ],
      ),
    );
  }
}


