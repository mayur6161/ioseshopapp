import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_shop_app/config/config.dart';
import 'package:e_shop_app/model/cart_model.dart';
import 'package:e_shop_app/model/item.dart';
import 'package:e_shop_app/providers/cart_provider.dart';
import 'package:e_shop_app/screens/product_details_screen.dart';
import 'package:e_shop_app/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_number_picker/flutter_number_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget cartProductCard(String cartId, String productId, String userId,
    CartModel model, BuildContext context, double width) {
  return InkWell(
    onTap: () {
      ItemModel itemModel = ItemModel(
          title: model.title,
          shortInfo: model.shortInfo,
          publishedDate: model.publishedDate,
          thumbnailUrl: model.thumbnailUrl,
          longDescription: model.longDescription,
          status: model.status,
          price: model.price);
      Route route = MaterialPageRoute(
          builder: (c) => ProductDetailsScreen(
                itemModel: itemModel,
                productId: productId,
              ));
      Navigator.pushReplacement(context, route);
    },
    splashColor: kPrimaryColor,
    child: Padding(
      padding: const EdgeInsets.all(6.0),
      child: SizedBox(
        height: 160,
        width: width,
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: model.thumbnailUrl[0],
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              width: width * 0.4,
              height: 140.0,
            ),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const SizedBox(
                        width: 5.0,
                      ),
                      Expanded(
                        child: Text(
                          model.title,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16.0),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 5.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Row(
                              children: [
                                const Text(
                                  r"Price: ",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.grey,
                                  ),
                                ),
                                const Text(
                                  "₹ ",
                                  style: TextStyle(
                                      color: kPrimaryColor, fontSize: 16.0),
                                ),
                                Text(
                                  (model.price).toString(),
                                  style: const TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  CustomNumberPicker(
                    valueTextStyle: const TextStyle(fontSize: 16),
                    initialValue: model.itemCount,
                    maxValue: 10,
                    minValue: 1,
                    step: 1,
                    onValue: (value) {
                      Provider.of<CartProvider>(context, listen: false)
                          .updateItemCount(
                              userId, cartId, int.parse(value.toString()));
                    },
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: kPrimaryColor,
                        ),
                        onPressed: () {
                          Provider.of<CartProvider>(context, listen: false)
                              .removeCartItem(userId, cartId)
                              .then((value) async {
                            final Future<SharedPreferences> _prefs =
                                SharedPreferences.getInstance();
                            final SharedPreferences prefs = await _prefs;
                            List<String>? cartList =
                                prefs.getStringList(EcommerceApp.userCartList);
                            cartList!
                                .removeWhere((element) => element == productId);
                            prefs.setStringList(
                                EcommerceApp.userCartList, cartList);
                          });
                        },
                      )),
                  const Divider(
                    height: 5.0,
                    color: kPrimaryColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
