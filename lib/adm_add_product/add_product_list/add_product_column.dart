import 'package:e_shop_app/Admin/add_product_screen.dart';
import 'package:e_shop_app/adm_add_product/Apartment_product/product_for_apartment.dart';
import 'package:e_shop_app/adm_add_product/delivery_details_item/delivery_details_home.dart';
import 'package:e_shop_app/adm_add_product/extra_item_details_item/extra_item_home.dart';
import 'package:e_shop_app/adm_add_product/flower_gift/flowers_gift_home.dart';
import 'package:e_shop_app/adm_add_product/indoor_product/indoor_product_home.dart';
import 'package:e_shop_app/adm_add_product/outdoor_product/outdoor_product_home.dart';
import 'package:e_shop_app/adm_add_product/productforhome/product_for_home.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({
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
                Route route = MaterialPageRoute(
                    builder: (c) => const AddProductScreen(
                          editOrAdd: "Add",
                          productId: "1",
                        ));
                Navigator.push(context, route);
              },
              child: Text("Item Add")),
        ),
        Container(
          width: width / 2,
          child: TextButton(
              onPressed: () {
                Route route = MaterialPageRoute(
                    builder: (c) => const ProductForHomeScreen(
                          editOrAdd: "Add",
                          productId: "1",
                        ));
                Navigator.push(context, route);
              },
              child: const Text("Product For Home Add")),
        ),
        Container(
          width: width / 2,
          child: TextButton(
              onPressed: () {
                Route route = MaterialPageRoute(
                    builder: (c) => const ProductForApartmentScreen(
                          editOrAdd: "Add",
                          productId: "1",
                        ));
                Navigator.push(context, route);
              },
              child: Text("Product For Apartment Add")),
        ),
        SizedBox(
          width: width / 2,
          child: TextButton(
              onPressed: () {
                Route route = MaterialPageRoute(
                    builder: (c) => const FlowerGiftScreen(
                          editOrAdd: "Add",
                          productId: "1",
                        ));
                Navigator.push(context, route);
              },
              child: const Text("Flower Gift Add")),
        ),
        SizedBox(
          width: width / 2,
          child: TextButton(
              onPressed: () {
                Route route = MaterialPageRoute(
                    builder: (c) => const IndoorProductScreenAdmin(
                      editOrAdd: "Add",
                      productId: "1",
                    ));
                Navigator.push(context, route);
              },
              child: const Text("Indoor Plant Add")),
        ),
        SizedBox(
          width: width / 2,
          child: TextButton(
              onPressed: () {
                Route route = MaterialPageRoute(
                    builder: (c) => const OutdoorProductScreenAdmin(
                      editOrAdd: "Add",
                      productId: "1",
                    ));
                Navigator.push(context, route);
              },
              child: const Text("Outdoor Plant Add")),
        ),
        SizedBox(
          width: width / 2,
          child: TextButton(
              onPressed: () {
                Route route = MaterialPageRoute(
                    builder: (c) => const DeliveryDetailsScreen(
                      editOrAdd: "Add",
                      productId: "1",
                    ));
                Navigator.push(context, route);
              },
              child: const Text("Delivery Details Add")),
        ),
        SizedBox(
          width: width / 2,
          child: TextButton(
              onPressed: () {
                Route route = MaterialPageRoute(
                    builder: (c) => const ExtraItemDisplayScreen(
                      editOrAdd: "Add",
                      productId: "1",
                    ));
                Navigator.push(context, route);
              },
              child: const Text("Extra Item Add")),
        ),
      ],
    );
  }
}
