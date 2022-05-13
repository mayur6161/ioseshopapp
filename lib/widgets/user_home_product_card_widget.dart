import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_shop_app/config/config.dart';
import 'package:e_shop_app/model/item.dart';
import 'package:e_shop_app/providers/product_provider.dart';
import 'package:e_shop_app/screens/product_details_screen.dart';
import 'package:e_shop_app/view_more_screen/view_more_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'colors.dart';

class UserHomeProductCardWidget extends StatefulWidget {
  final ItemModel itemModel;
  final BuildContext context;
  final String productId;

  const UserHomeProductCardWidget(
      {Key? key,
      required this.itemModel,
      required this.context,
      required this.productId})
      : super(key: key);

  @override
  State<UserHomeProductCardWidget> createState() =>
      _UserHomeProductCardWidgetState();
}

class _UserHomeProductCardWidgetState extends State<UserHomeProductCardWidget> {
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
    return InkWell(
      onTap: () {
        Route route = MaterialPageRoute(
            builder: (c) => ProductDetailsScreen(
                  itemModel: widget.itemModel,
                  productId: widget.productId,
                ));
        Navigator.push(context, route);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.green.withOpacity(0.1),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  right: 8.0, left: 8.0, top: 8.0, bottom: 8.0),
              child: SizedBox(
                height: 120,
                child: CachedNetworkImage(
                  imageUrl: widget.itemModel.thumbnailUrl[0],
                  placeholder: (context, url) => Center(
                    child: Transform.scale(
                      scale: 0,
                      child: const CircularProgressIndicator(),
                    ),
                  ),
                  width: width,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0),
              child: SizedBox(
                child: AutoSizeText(
                  widget.itemModel.title,
                  maxLines: 1,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class PriceUserHomeProductCardWidget extends StatefulWidget {
  final ItemModel itemModel;
  final BuildContext context;
  final String productId;

  const PriceUserHomeProductCardWidget(
      {Key? key,
        required this.itemModel,
        required this.context,
        required this.productId})
      : super(key: key);

  @override
  State<PriceUserHomeProductCardWidget> createState() =>
      _PriceUserHomeProductCardWidgetState();
}

class _PriceUserHomeProductCardWidgetState extends State<PriceUserHomeProductCardWidget> {
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
    return InkWell(
      onTap: () {
        Route route = MaterialPageRoute(
            builder: (c) => ProductDetailsScreen(
              itemModel: widget.itemModel,
              productId: widget.productId,
            ));
        Navigator.push(context, route);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.green.withOpacity(0.1),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  right: 8.0, left: 8.0, top: 8.0, bottom: 8.0),
              child: SizedBox(
                height: 120,
                child: CachedNetworkImage(
                  imageUrl: widget.itemModel.thumbnailUrl[0],
                  placeholder: (context, url) => Center(
                    child: Transform.scale(
                      scale: 0,
                      child: const CircularProgressIndicator(),
                    ),
                  ),
                  width: width,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0, bottom: 5.0),
                  child: SizedBox(
                    child: AutoSizeText(
                      widget.itemModel.title,
                      maxLines: 1,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5.0, bottom: 5.0),
                  child: Text(
                    "₹" + widget.itemModel.price.toString(),
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class UserHomeProductCardWidget2 extends StatefulWidget {
  final ItemModel itemModel;
  final BuildContext context;
  final String productId;

  const UserHomeProductCardWidget2(
      {Key? key,
      required this.itemModel,
      required this.context,
      required this.productId})
      : super(key: key);

  @override
  State<UserHomeProductCardWidget2> createState() =>
      _UserHomeProductCardWidget2State();
}

class _UserHomeProductCardWidget2State
    extends State<UserHomeProductCardWidget2> {
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
            const AutoSizeText(
              "Recommended",
              style: TextStyle(
                color: kBackgroundColor,
                fontSize: 20,
                fontFamily: "SFCMed",
              ),
            ),
            TextButton(
              onPressed: () {
                Route route =
                    MaterialPageRoute(builder: (c) => const ViewMore());
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

class DeliveryDetails extends StatefulWidget {
  final ItemModel itemModel;
  final BuildContext context;
  final String productId;

  const DeliveryDetails(
      {Key? key,
      required this.itemModel,
      required this.context,
      required this.productId})
      : super(key: key);

  @override
  State<DeliveryDetails> createState() => _DeliveryDetailsState();
}

class _DeliveryDetailsState extends State<DeliveryDetails> {
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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 12.0, left: 12.0, bottom: 10.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: AutoSizeText(
              widget.itemModel.title,
              style: const TextStyle(fontSize: 19, fontFamily: "SFCMed"),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12.0, left: 12.0, bottom: 10.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: AutoSizeText(
              widget.itemModel.longDescription,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

