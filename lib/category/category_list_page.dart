import 'package:e_shop_app/Admin/admin_home_screen.dart';
import 'package:e_shop_app/category/product_for_home/product_for_home_items.dart';
import 'package:e_shop_app/widgets/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'category_page.dart';

class Category_list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
              Route route =
                  MaterialPageRoute(builder: (c) => const AdminHomeScreen());
              Navigator.pushReplacement(context, route);
            },
          ),
          title: const Text('Category List'),
        ),
        body: Column(
          children: [
            Container(
              height: 100,
              width: width,
              color: Colors.deepPurple,
              child: TextButton(
                onPressed: () {
                  Route route =
                      MaterialPageRoute(builder: (c) => CatergoryPage());
                  Navigator.pushReplacement(context, route);
                },
                child: Text(
                  "category items",
                  style: TextStyle(
                    color: kBackgroundColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              height: 100,
              width: width,
              color: Colors.pink,
              child: TextButton(
                onPressed: () {
                  Route route =
                      MaterialPageRoute(builder: (c) => ProductForHome());
                  Navigator.pushReplacement(context, route);
                },
                child: Text(
                  "Home category items",
                  style: TextStyle(
                    color: kBackgroundColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              width: width,
              height: 100,
              color: Colors.red,
              child: TextButton(
                onPressed: () {
                  Route route =
                      MaterialPageRoute(builder: (c) => CatergoryPage());
                  Navigator.pushReplacement(context, route);
                },
                child: Text(
                  "category three",
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
