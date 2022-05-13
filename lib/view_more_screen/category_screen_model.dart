import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_shop_app/config/config.dart';
import 'package:e_shop_app/model/item.dart';
import 'package:e_shop_app/plants_under_list/plants_under_high_price.dart';
import 'package:e_shop_app/screens/product_details_screen.dart';
import 'package:e_shop_app/view_more_screen/plant_containers.dart';
import 'package:e_shop_app/view_more_screen/see_all_plants.dart';
import 'package:e_shop_app/view_more_screen/view_more_screen.dart';
import 'package:e_shop_app/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'indoor_user_list.dart';
import 'new_in_list.dart';
import 'outdoor_user_list.dart';

class NewInList extends StatefulWidget {
  final ItemModel itemModel;
  final BuildContext context;
  final String productId;

  const NewInList(
      {Key? key,
      required this.itemModel,
      required this.context,
      required this.productId})
      : super(key: key);

  @override
  State<NewInList> createState() => _NewInListState();
}

class _NewInListState extends State<NewInList> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String? userId = '';

  Future<void> userData() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      userId = prefs.getString(EcommerceApp.userUID);
    });
  }

  @override
  void initState() {
    super.initState();
    userData();
  }

  @override
  Widget build(BuildContext context) {
//    double width = MediaQuery.of(context).size.width;
//    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          colors: [Colors.green, kPrimaryColor],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 6.0, left: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const AutoSizeText(
              "New In List",
              style: TextStyle(
                  fontSize: 20, color: kBackgroundColor, fontFamily: "SFCMed"),
            ),
            TextButton(
              onPressed: () {
                Route route =
                    MaterialPageRoute(builder: (c) => const NewInListUserPage());
                Navigator.push(context, route);
              },
              child: const Text(
                "ViewMore",
                style: TextStyle(
                    fontSize: 18, fontFamily: "SFCMed", color: kBackgroundColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ApartmentSuit extends StatefulWidget {
  final ItemModel itemModel;
  final BuildContext context;
  final String productId;

  const ApartmentSuit(
      {Key? key,
      required this.itemModel,
      required this.context,
      required this.productId})
      : super(key: key);

  @override
  State<ApartmentSuit> createState() => _ApartmentSuitState();
}

class _ApartmentSuitState extends State<ApartmentSuit> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String? userId = '';

  Future<void> userData() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      userId = prefs.getString(EcommerceApp.userUID);
    });
  }

  @override
  void initState() {
    super.initState();
    userData();
  }

  @override
  Widget build(BuildContext context) {
//    double width = MediaQuery.of(context).size.width;
//    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          colors: [Colors.green, kPrimaryColor],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 6.0, left: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const AutoSizeText(
              "Best Choices",
              style: TextStyle(
                  fontSize: 20, color: kBackgroundColor, fontFamily: "SFCMed"),
            ),
            TextButton(
              onPressed: () {
                Route route =
                    MaterialPageRoute(builder: (c) => const PlantsUnderHighPricePage());
                Navigator.push(context, route);
              },
              child: const Text(
                "ViewMore",
                style: TextStyle(
                    fontSize: 18, fontFamily: "SFCMed", color: kBackgroundColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChoicesForHOme extends StatefulWidget {
  final ItemModel itemModel;
  final BuildContext context;
  final String productId;

  const ChoicesForHOme(
      {Key? key,
      required this.itemModel,
      required this.context,
      required this.productId})
      : super(key: key);

  @override
  State<ChoicesForHOme> createState() => _ChoicesForHOmeState();
}

class _ChoicesForHOmeState extends State<ChoicesForHOme> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String? userId = '';

  Future<void> userData() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      userId = prefs.getString(EcommerceApp.userUID);
    });
  }

  @override
  void initState() {
    super.initState();
    userData();
  }

  @override
  Widget build(BuildContext context) {
//    double width = MediaQuery.of(context).size.width;
//    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          colors: [Colors.green, kPrimaryColor],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 6.0, left: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const AutoSizeText(
              "Containers",
              style: TextStyle(
                  fontSize: 20, color: kBackgroundColor, fontFamily: "SFCMed"),
            ),
            TextButton(
              onPressed: () {
                Route route =
                    MaterialPageRoute(builder: (c) => const PlantContainers());
                Navigator.push(context, route);
              },
              child: const Text(
                "ViewMore",
                style: TextStyle(
                    fontSize: 18, fontFamily: "SFCMed", color: kBackgroundColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SuitableForTable extends StatefulWidget {
  final ItemModel itemModel;
  final BuildContext context;
  final String productId;

  const SuitableForTable(
      {Key? key,
      required this.itemModel,
      required this.context,
      required this.productId})
      : super(key: key);

  @override
  State<SuitableForTable> createState() => _SuitableForTableState();
}

class _SuitableForTableState extends State<SuitableForTable> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String? userId = '';

  Future<void> userData() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      userId = prefs.getString(EcommerceApp.userUID);
    });
  }

  @override
  void initState() {
    super.initState();
    userData();
  }

  @override
  Widget build(BuildContext context) {
//    double width = MediaQuery.of(context).size.width;
//    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          colors: [Colors.green, kPrimaryColor],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const AutoSizeText(
              "Outdoor Plants",
              style: TextStyle(
                  fontSize: 20, color: kBackgroundColor, fontFamily: "SFCMed"),
            ),
            TextButton(
              onPressed: () {
                Route route =
                    MaterialPageRoute(builder: (c) => const OutdoorPlantUserList());
                Navigator.push(context, route);
              },
              child: const Text(
                "ViewMore",
                style: TextStyle(
                    fontSize: 18, fontFamily: "SFCMed", color: kBackgroundColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class YouMayLike extends StatefulWidget {
  final ItemModel itemModel;
  final BuildContext context;
  final String productId;

  const YouMayLike(
      {Key? key,
      required this.itemModel,
      required this.context,
      required this.productId})
      : super(key: key);

  @override
  State<YouMayLike> createState() => _YouMayLikeState();
}

class _YouMayLikeState extends State<YouMayLike> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String? userId = '';

  Future<void> userData() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      userId = prefs.getString(EcommerceApp.userUID);
    });
  }

  @override
  void initState() {
    super.initState();
    userData();
  }

  @override
  Widget build(BuildContext context) {
//    double width = MediaQuery.of(context).size.width;
//    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          colors: [Colors.green, kPrimaryColor],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const AutoSizeText(
              "Indoor Plants",
              style: TextStyle(
                  fontSize: 20, color: kBackgroundColor, fontFamily: "SFCMed"),
            ),
            TextButton(
              onPressed: () {
                Route route =
                    MaterialPageRoute(builder: (c) => const IndoorPlantUserList());
                Navigator.push(context, route);
              },
              child: const Text(
                "ViewMore",
                style: TextStyle(
                    fontSize: 18, fontFamily: "SFCMed", color: kBackgroundColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class DiscoverBar extends StatefulWidget {
  @override
  _DiscoverBarState createState() => _DiscoverBarState();
}

class _DiscoverBarState extends State<DiscoverBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 4.0, top: 3.0, bottom: 3.0),
        child: Container(
          child: const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Discover Your Like",
              style: TextStyle(
                  fontSize: 22, fontFamily: "SFCMed", color: kTextColor),
            ),
          ),
        ),
      ),
    );
  }
}


class FindIn199 extends StatefulWidget {
  @override
  _FindIn199State createState() => _FindIn199State();
}

class _FindIn199State extends State<FindIn199> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 4.0, top: 3.0, bottom: 3.0),
        child: Container(
          child: const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Find Under 199",
              style: TextStyle(
                  fontSize: 22, fontFamily: "SFCMed", color: kTextColor),
            ),
          ),
        ),
      ),
    );
  }
}

class ViewAllProducts extends StatefulWidget {
  @override
  _ViewAllProductsState createState() => _ViewAllProductsState();
}

class _ViewAllProductsState extends State<ViewAllProducts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 4.0, top: 3.0, bottom: 3.0),
        child: Container(
          child: const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "All Products",
              style: TextStyle(
                  fontSize: 22, fontFamily: "SFCMed", color: kTextColor),
            ),
          ),
        ),
      ),
    );
  }
}


class IndoorPlants extends StatefulWidget {
  @override
  _IndoorPlantsState createState() => _IndoorPlantsState();
}

class _IndoorPlantsState extends State<IndoorPlants> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 4.0, top: 3.0, bottom: 3.0),
        child: Container(
          child: const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Indoor Plants",
              style: TextStyle(
                  fontSize: 22, fontFamily: "SFCMed", color: kTextColor),
            ),
          ),
        ),
      ),
    );
  }
}

class OutDoorPlants extends StatefulWidget {
  @override
  _OutDoorPlantsState createState() => _OutDoorPlantsState();
}

class _OutDoorPlantsState extends State<OutDoorPlants> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 4.0, top: 3.0, bottom: 3.0),
        child: Container(
          child: const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Outdoor Plants",
              style: TextStyle(
                  fontSize: 22, fontFamily: "SFCMed", color: kTextColor),
            ),
          ),
        ),
      ),
    );
  }
}

class IndoorOutDoorPlants extends StatefulWidget {
  @override
  _IndoorOutDoorPlantsState createState() => _IndoorOutDoorPlantsState();
}

class _IndoorOutDoorPlantsState extends State<IndoorOutDoorPlants> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 4.0, top: 3.0, bottom: 3.0),
        child: Container(
          child: const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Indoor Outdoor Plants",
              style: TextStyle(
                  fontSize: 22, fontFamily: "SFCMed", color: kTextColor),
            ),
          ),
        ),
      ),
    );
  }
}


class IndoorTablePlants extends StatefulWidget {
  @override
  _IndoorTablePlantsState createState() => _IndoorTablePlantsState();
}

class _IndoorTablePlantsState extends State<IndoorTablePlants> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 4.0, top: 3.0, bottom: 3.0),
        child: Container(
          child: const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "More Picks For Table",
              style: TextStyle(
                  fontSize: 22, fontFamily: "SFCMed", color: kTextColor),
            ),
          ),
        ),
      ),
    );
  }
}


class RecommendedForTable extends StatefulWidget {
  @override
  _RecommendedForTableState createState() => _RecommendedForTableState();
}

class _RecommendedForTableState extends State<RecommendedForTable> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 4.0, top: 3.0, bottom: 3.0),
        child: Container(
          child: const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Recommended For Table",
              style: TextStyle(
                  fontSize: 22, fontFamily: "SFCMed", color: kTextColor),
            ),
          ),
        ),
      ),
    );
  }
}

class PlantContainerHeading extends StatefulWidget {
  @override
  _PlantContainerHeadingState createState() => _PlantContainerHeadingState();
}

class _PlantContainerHeadingState extends State<PlantContainerHeading> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 4.0, top: 3.0, bottom: 3.0),
        child: Container(
          child: const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Plant Containers",
              style: TextStyle(
                  fontSize: 22, fontFamily: "SFCMed", color: kTextColor),
            ),
          ),
        ),
      ),
    );
  }
}

class SeeAllPlantsheading extends StatefulWidget {
  @override
  _SeeAllPlantsheadingState createState() => _SeeAllPlantsheadingState();
}

class _SeeAllPlantsheadingState extends State<SeeAllPlantsheading> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 4.0, top: 3.0, bottom: 3.0),
        child: Container(
          child: const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "All Plants",
              style: TextStyle(
                  fontSize: 22, fontFamily: "SFCMed", color: kTextColor),
            ),
          ),
        ),
      ),
    );
  }
}

class FindIn399 extends StatefulWidget {
  @override
  _FindIn399State createState() => _FindIn399State();
}

class _FindIn399State extends State<FindIn399> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 4.0, top: 3.0, bottom: 3.0),
        child: Container(
          child: const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Find Under 399",
              style: TextStyle(
                  fontSize: 22, fontFamily: "SFCMed", color: kTextColor),
            ),
          ),
        ),
      ),
    );
  }
}

class FindIn499 extends StatefulWidget {
  @override
  _FindIn499State createState() => _FindIn499State();
}

class _FindIn499State extends State<FindIn499> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 4.0, top: 3.0, bottom: 3.0),
        child: Container(
          child: const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Find Under 499",
              style: TextStyle(
                  fontSize: 22, fontFamily: "SFCMed", color: kTextColor),
            ),
          ),
        ),
      ),
    );
  }
}

class FindIn699 extends StatefulWidget {
  @override
  _FindIn699State createState() => _FindIn699State();
}

class _FindIn699State extends State<FindIn699> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 4.0, top: 3.0, bottom: 3.0),
        child: Container(
          child: const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Find Under 699",
              style: TextStyle(
                  fontSize: 22, fontFamily: "SFCMed", color: kTextColor),
            ),
          ),
        ),
      ),
    );
  }
}

class FindIn999 extends StatefulWidget {
  @override
  _FindIn999State createState() => _FindIn999State();
}

class _FindIn999State extends State<FindIn999> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 4.0, top: 3.0, bottom: 3.0),
        child: Container(
          child: const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Find Under 999",
              style: TextStyle(
                  fontSize: 22, fontFamily: "SFCMed", color: kTextColor),
            ),
          ),
        ),
      ),
    );
  }
}


class AllPlantsBar extends StatefulWidget {
  final ItemModel itemModel;
  final BuildContext context;
  final String productId;

  const AllPlantsBar(
      {Key? key,
        required this.itemModel,
        required this.context,
        required this.productId})
      : super(key: key);

  @override
  State<AllPlantsBar> createState() => _AllPlantsBarState();
}

class _AllPlantsBarState extends State<AllPlantsBar> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String? userId = '';

  Future<void> userData() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      userId = prefs.getString(EcommerceApp.userUID);
    });
  }

  @override
  void initState() {
    super.initState();
    userData();
  }

  @override
  Widget build(BuildContext context) {
//    double width = MediaQuery.of(context).size.width;
//    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          colors: [Colors.green, kPrimaryColor],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 6.0, left: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const AutoSizeText(
              "Find More Plants",
              style: TextStyle(
                  fontSize: 20, color: kBackgroundColor, fontFamily: "SFCMed"),
            ),
            TextButton(
              onPressed: () {
                Route route =
                MaterialPageRoute(builder: (c) => const SeeAllPlants());
                Navigator.push(context, route);
              },
              child: const Text(
                "ViewMore",
                style: TextStyle(
                    fontSize: 18, fontFamily: "SFCMed", color: kBackgroundColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FindInHighPrice extends StatefulWidget {
  @override
  _FindInHighPriceState createState() => _FindInHighPriceState();
}

class _FindInHighPriceState extends State<FindInHighPrice> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 4.0, top: 3.0, bottom: 3.0),
        child: Container(
          child: const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Best Choices",
              style: TextStyle(
                  fontSize: 22, fontFamily: "SFCMed", color: kTextColor),
            ),
          ),
        ),
      ),
    );
  }
}


class NewInListUserBar extends StatefulWidget {
  @override
  _NewInListUserBarState createState() => _NewInListUserBarState();
}

class _NewInListUserBarState extends State<NewInListUserBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 4.0, top: 3.0, bottom: 3.0),
        child: Container(
          child: const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "New In List",
              style: TextStyle(
                  fontSize: 22, fontFamily: "SFCMed", color: kTextColor),
            ),
          ),
        ),
      ),
    );
  }
}