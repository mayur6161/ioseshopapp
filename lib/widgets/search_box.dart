import 'package:e_shop_app/screens/search_product_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class SearchBoxDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) =>
      InkWell(
        onTap: () {
          Route route =
          MaterialPageRoute(builder: (c) => const SearchProductScreen());
          Navigator.push(context, route);
        },
        child: Container(
          height: 0,
        ),
      );

  @override
  double get maxExtent => 1;

  @override
  double get minExtent => 1;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
