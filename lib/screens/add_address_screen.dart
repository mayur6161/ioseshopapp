import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop_app/config/config.dart';
import 'package:e_shop_app/model/address.dart';
import 'package:e_shop_app/model/cart_model.dart';
import 'package:e_shop_app/screens/address_screen.dart';
import 'package:e_shop_app/screens/home_screen.dart';
import 'package:e_shop_app/widgets/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddAddress extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final cName = TextEditingController();
  final cPhoneNumber = TextEditingController();
  final cFlatHomeNumber = TextEditingController();
  final clandmark = TextEditingController();
  final cAddressline2 = TextEditingController();
  final cCity = TextEditingController();
  final cState = TextEditingController();
  final cPinCode = TextEditingController();

  String userId;
  double totalAmount;
  final List<CartModel> productCount;
  String type;
  String buyType;

  AddAddress(
      {Key? key,
      required this.userId,
      required this.totalAmount,
      required this.productCount,
      required this.type,
      required this.buyType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [kPrimaryColor, Colors.green],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
        centerTitle: true,
        title: Column(
          children: const [
            Text(
              "Go Green",
              style: TextStyle(fontFamily: 'SFCMed', fontSize: 22),
            ),
            Text(
              'Plant Shop',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(50.0),
            ),
            gradient: LinearGradient(
              colors: [kPrimaryColor, Colors.green],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
          height: 48,
          width: width,
          child: FloatingActionButton.extended(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                final model = AddressModel(
                  name: cName.text.trim(),
                  state: cState.text.trim(),
                  pincode: cPinCode.text,
                  phoneNumber: cPhoneNumber.text,
                  flatNumber: cFlatHomeNumber.text,
                  addressline2: cAddressline2.text,
                  landmark: clandmark.text,
                  city: cCity.text.trim(),
                ).toJson();

                //add to firestore
                FirebaseFirestore.instance
                    .collection(EcommerceApp.collectionUser)
                    .doc(userId)
                    .collection(EcommerceApp.subCollectionAddress)
                    .doc(DateTime.now().millisecondsSinceEpoch.toString())
                    .set(model)
                    .then((value) {
                  const snack = SnackBar(
                      content: Text("New Address added successfully."));
                  ScaffoldMessenger.of(context).showSnackBar(snack);
                  FocusScope.of(context).requestFocus(FocusNode());
                  formKey.currentState!.reset();
                });

                if (type == "yes") {
                  Route route = MaterialPageRoute(
                      builder: (c) => AddressScreen(
                            totalAmount: totalAmount,
                            productCount: productCount,
                            buyType: buyType,
                          ));
                  Navigator.pushReplacement(context, route);
                } else {
                  Route route =
                      MaterialPageRoute(builder: (c) => const HomeScreen());
                  Navigator.pushReplacement(context, route);
                }
              }
            },
            label: const Text(
              "Done",
              style: TextStyle(fontSize: 18),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            icon: const Icon(Icons.check),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Add New Address",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              ),
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  MyTextField(
                    hint: "Name",
                    controller: cName,
                  ),
                  MyTextField(
                    hint: "Phone Number",
                    controller: cPhoneNumber,
                  ),
                  MyTextField(
                    hint: "Flat Number / House Number",
                    controller: cFlatHomeNumber,
                  ),
                  MyTextField(
                    hint: "Landmark",
                    controller: clandmark,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: const InputDecoration.collapsed(
                          hintText:
                              'Address Line 2 / Note / Alternative Phone Number'),
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: 10,
                      controller: cAddressline2,
                    ),
                  ),
                  MyTextField(
                    hint: "City",
                    controller: cCity,
                  ),
                  MyTextField(
                    hint: "State / Country",
                    controller: cState,
                  ),
                  MyTextField(
                    hint: "Pin Code",
                    controller: cPinCode,
                  ),
                ],
              ),
            ),
            Container(
              height: height / 4,
              color: kBackgroundColor,
            ),
          ],
        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;

  const MyTextField({
    Key? key,
    required this.hint,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration.collapsed(hintText: hint),
        validator: (val) => val!.isEmpty ? "Field can not be empty." : null,
      ),
    );
  }
}
