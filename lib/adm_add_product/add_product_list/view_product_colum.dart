import 'package:e_shop_app/adm_add_product/Apartment_product/product_for_apartment_list.dart';
import 'package:e_shop_app/adm_add_product/delivery_details_item/delivey_details_home_list.dart';
import 'package:e_shop_app/adm_add_product/extra_item_details_item/extra_item_home_list.dart';
import 'package:e_shop_app/adm_add_product/flower_gift/flowers_gift_home_list.dart';
import 'package:e_shop_app/adm_add_product/indoor_product/indoor_home_list.dart';
import 'package:e_shop_app/adm_add_product/items/items_view.dart';
import 'package:e_shop_app/adm_add_product/outdoor_product/outdoor_home_list.dart';
import 'package:e_shop_app/adm_add_product/productforhome/product_for_home_list.dart';
import 'package:e_shop_app/view_more_screen/category_screen_model.dart';
import 'package:flutter/material.dart';

class ViewProduct extends StatelessWidget {
  const ViewProduct({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: width / 2,
          child: TextButton(
              onPressed: () {
                Route route = MaterialPageRoute(builder: (c) => ViewAllItems());
                Navigator.push(context, route);
              },
              child: Text("Item view")),
        ),
        Container(
          width: width / 2,
          child: TextButton(
              onPressed: () {
                Route route = MaterialPageRoute(
                    builder: (c) => ProductForHomeListScreen());
                Navigator.push(context, route);
              },
              child: Text("Product For Home view")),
        ),
        Container(
          width: width / 2,
          child: TextButton(
              onPressed: () {
                Route route = MaterialPageRoute(
                    builder: (c) => ProductForApartmentListScreen());
                Navigator.push(context, route);
              },
              child: Text("Product For Apartment view")),
        ),
        Container(
          width: width / 2,
          child: TextButton(
              onPressed: () {
                Route route =
                    MaterialPageRoute(builder: (c) => FlowerGiftListScreen());
                Navigator.push(context, route);
              },
              child: Text("Flower Gift view")),
        ),
        Container(
          width: width / 2,
          child: TextButton(
              onPressed: () {
                Route route = MaterialPageRoute(
                    builder: (c) => IndoorProductListScreen());
                Navigator.push(context, route);
              },
              child: const Text("Indoor Plant view")),
        ),
        Container(
          width: width / 2,
          child: TextButton(
              onPressed: () {
                Route route = MaterialPageRoute(
                    builder: (c) => OutdoorProductListScreen());
                Navigator.push(context, route);
              },
              child: const Text("Outdoor Plant view")),
        ),
        Container(
          width: width / 2,
          child: TextButton(
              onPressed: () {
                Route route = MaterialPageRoute(
                    builder: (c) => DeliveryDetailsListScreen());
                Navigator.push(context, route);
              },
              child: const Text("Delivery Details List")),
        ),
        Container(
          width: width / 2,
          child: TextButton(
              onPressed: () {
                Route route = MaterialPageRoute(
                    builder: (c) => ExtraItemDisplayListScreen());
                Navigator.push(context, route);
              },
              child: const Text("Extra Item List")),
        ),
      ],
    );
  }
}
