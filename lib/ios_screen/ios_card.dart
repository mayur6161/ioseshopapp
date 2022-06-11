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

import 'ios_product_screen.dart';





class IosUserHomeProductCardWidget extends StatefulWidget {
  final ItemModel itemModel;
  final BuildContext context;
  final String productId;

  const IosUserHomeProductCardWidget(
      {Key? key,
        required this.itemModel,
        required this.context,
        required this.productId})
      : super(key: key);

  @override
  State<IosUserHomeProductCardWidget> createState() =>
      _IosUserHomeProductCardWidgetState();
}

class _IosUserHomeProductCardWidgetState extends State<IosUserHomeProductCardWidget> {
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
            builder: (c) => IosProductDetailsScreen(
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