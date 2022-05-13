import 'package:e_shop_app/model/cart_model.dart';

class UserOrdersModel {
  final String addressID;
  final bool isSuccess;
  final String orderBy;
  final String orderTime;
  final String paymentDetails;
  final List<CartModel> productIDs;
  final double totalAmount;

  const UserOrdersModel(
      {required this.addressID,
      required this.isSuccess,
      required this.orderBy,
      required this.orderTime,
      required this.paymentDetails,
      required this.totalAmount,
      required this.productIDs});

  factory UserOrdersModel.fromJson(Map<String, dynamic> json) {
    List<CartModel> productID = [];
    if (json['productData'] != null) {
      json['productData'].forEach((v) {
        productID.add(CartModel.fromJson(v));
      });
    }
    return UserOrdersModel(
      addressID: json['addressID'] as String,
      isSuccess: json['isSuccess'] as bool,
      orderBy: json['orderBy'] as String,
      orderTime: json['orderTime'] as String,
      paymentDetails: json['paymentDetails'] as String,
      productIDs: productID,
      totalAmount: json['totalAmount'] as double,
    );
  }

  Map<String, dynamic> toJson() => {
        'addressID': addressID,
        'isSuccess': isSuccess,
        'orderBy': orderBy,
        'orderTime': orderTime,
        'paymentDetails': paymentDetails,
        'totalAmount': totalAmount,
        'productData': productIDs.map((v) => v.toJson()).toList(),
      };
}

class ProductData {
  final String productId;
  final int itemCount;

  const ProductData({
    required this.productId,
    required this.itemCount,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      productId: json['productId'] as String,
      itemCount: json['itemCount'] as int,
    );
  }

  Map<String, dynamic> toJson() => {
        'productId': productId,
        'itemCount': itemCount,
      };
}
