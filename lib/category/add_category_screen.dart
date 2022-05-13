import 'package:e_shop_app/Admin/admin_home_screen.dart';
import 'package:e_shop_app/category/product_for_home/produt_for_home.dart';
import 'package:e_shop_app/widgets/colors.dart';
import 'package:flutter/material.dart';

import 'add_product_screen_catergory.dart';

class AddCategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        // ignore: avoid_print
        print('The user tries to pop()');
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Route route =
              MaterialPageRoute(builder: (c) => const AdminHomeScreen());
              Navigator.pushReplacement(context, route);
            },
          ),

          title: const Text('Add Product By Category'),
        ),
        body: Column(
          children: [
            Container(
              color: Colors.deepPurple,
              height: 100,
              width: width,
              child: TextButton(
                onPressed: () {
                  Route route = MaterialPageRoute(
                      builder: (c) => const AddProductScreenCatergory(
                        editOrAdd: "Add",
                        productId: "1",
                      ));
                  Navigator.push(context, route);
                },
                child: const Text(
                  "category add items",
                  style: TextStyle(
                    color: kBackgroundColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.yellow,
              height: 100,
              width: width,
              child: TextButton(
                onPressed: () {
                  Route route = MaterialPageRoute(
                      builder: (c) => const ProductForHomeAdd(
                        editOrAdd: "Add",
                        productId: "1",
                      ));
                  Navigator.push(context, route);
                },
                child: const Text(
                  "Product For Home category",
                  style: TextStyle(
                    color: kBackgroundColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.grey,
              height: 100,
              width: width,
              child: TextButton(
                onPressed: () {
                  Route route = MaterialPageRoute(
                      builder: (c) => const AddProductScreenCatergory(
                        editOrAdd: "Add",
                        productId: "1",
                      ));
                  Navigator.push(context, route);
                },
                child: const Text(
                  "category",
                  style: TextStyle(
                    color: kBackgroundColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.brown,
              height: 100,
              width: width,
              child: TextButton(
                onPressed: () {
                  Route route = MaterialPageRoute(
                      builder: (c) => const AddProductScreenCatergory(
                        editOrAdd: "Add",
                        productId: "1",
                      ));
                  Navigator.push(context, route);
                },
                child: const Text(
                  "category",
                  style: TextStyle(
                    color: kBackgroundColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
