import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_shop_app/config/config.dart';
import 'package:e_shop_app/model/item.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:e_shop_app/widgets/colors.dart';

class IosUserHomeProductCardWidget2 extends StatefulWidget {
  final ItemModel itemModel;
  final BuildContext context;
  final String productId;

  const IosUserHomeProductCardWidget2(
      {Key? key,
      required this.itemModel,
      required this.context,
      required this.productId})
      : super(key: key);

  @override
  State<IosUserHomeProductCardWidget2> createState() =>
      _IosUserHomeProductCardWidget2State();
}

class _IosUserHomeProductCardWidget2State
    extends State<IosUserHomeProductCardWidget2> {
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
        padding: const EdgeInsets.only(
          left: 8.0,
          right: 6.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: const Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Text(
                  "Recommended",
                  style: TextStyle(
                      fontSize: 23,
                      color: kBackgroundColor,
                      fontFamily: "SFCMed"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IosNewInList extends StatefulWidget {
  final ItemModel itemModel;
  final BuildContext context;
  final String productId;

  const IosNewInList(
      {Key? key,
      required this.itemModel,
      required this.context,
      required this.productId})
      : super(key: key);

  @override
  State<IosNewInList> createState() => _IosNewInListState();
}

class _IosNewInListState extends State<IosNewInList> {
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
            Container(
              child: const Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Text(
                  "New In List",
                  style: TextStyle(
                      fontSize: 23,
                      color: kBackgroundColor,
                      fontFamily: "SFCMed"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
