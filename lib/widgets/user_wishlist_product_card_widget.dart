import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_shop_app/config/config.dart';
import 'package:e_shop_app/model/item.dart';
import 'package:e_shop_app/model/wishlist.dart';
import 'package:e_shop_app/providers/product_provider.dart';
import 'package:e_shop_app/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'colors.dart';

class UserWishlistProductCardWidget extends StatefulWidget {
  final WishListModel itemModel;
  final BuildContext context;

  const UserWishlistProductCardWidget({
    Key? key,
    required this.itemModel,
    required this.context,
  }) : super(key: key);

  @override
  State<UserWishlistProductCardWidget> createState() =>
      _UserWishlistProductCardWidgetState();
}

class _UserWishlistProductCardWidgetState
    extends State<UserWishlistProductCardWidget> {
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
        ItemModel itemModel = ItemModel(
            title: widget.itemModel.title,
            shortInfo: widget.itemModel.shortInfo,
            publishedDate: widget.itemModel.publishedDate,
            thumbnailUrl: widget.itemModel.thumbnailUrl,
            longDescription: widget.itemModel.longDescription,
            status: widget.itemModel.status,
            price: widget.itemModel.price);
        Route route = MaterialPageRoute(
            builder: (c) => ProductDetailsScreen(
                  itemModel: itemModel,
                  productId: widget.itemModel.productId,
                ));
        Navigator.push(context, route);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CachedNetworkImage(
                imageUrl: widget.itemModel.thumbnailUrl[0],
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                height: 90,
                fit: BoxFit.contain,
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Consumer<ProductProvider>(builder: (ctx, data, _) {
                    return IconButton(
                        onPressed: () {
                          ItemModel itemModel = ItemModel(
                              title: widget.itemModel.title,
                              shortInfo: widget.itemModel.shortInfo,
                              publishedDate: widget.itemModel.publishedDate,
                              thumbnailUrl: widget.itemModel.thumbnailUrl,
                              longDescription: widget.itemModel.longDescription,
                              status: widget.itemModel.status,
                              price: widget.itemModel.price);
                          data.favouriteUpdate(
                              userId!,
                              Provider.of<ProductProvider>(context,
                                      listen: false)
                                  .wishListModel
                                  .where((element) =>
                                      element.productId ==
                                      widget.itemModel.productId)
                                  .isNotEmpty,
                              itemModel,
                              widget.itemModel.productId);
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: data.wishListModel
                                  .where((element) =>
                                      element.productId ==
                                      widget.itemModel.productId)
                                  .isNotEmpty
                              ? kPrimaryColor
                              : Colors.grey,
                        ));
                  }),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: AutoSizeText(
                      "\u20B9 ${widget.itemModel.price}",
                      maxLines: 1,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: AutoSizeText(
                      widget.itemModel.title,
                      maxLines: 1,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
