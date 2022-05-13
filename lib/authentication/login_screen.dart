import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop_app/Admin/admin_login.dart';
import 'package:e_shop_app/DialogBox/error_dialog.dart';
import 'package:e_shop_app/DialogBox/loading_dialog.dart';
import 'package:e_shop_app/authentication/reset_pass.dart';
import 'package:e_shop_app/config/config.dart';
import 'package:e_shop_app/model/wishlist.dart';
import 'package:e_shop_app/screens/home_screen.dart';
import 'package:e_shop_app/widgets/colors.dart';
import 'package:e_shop_app/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextEditingController =
  TextEditingController();
  final TextEditingController _passwordTextEditingController =
  TextEditingController();
  bool _isObscure = true;

  void _toggle() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width,
        _screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            height: 60.0,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Login To Your Account",
              style: TextStyle(
                fontFamily: 'MonoBold',
                color: kBackgroundColor,
                fontSize: 19,
              ),
            ),
          ),
          const SizedBox(
            height: 28.0,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(
                    _emailTextEditingController,
                    Icons.email,
                    "Email",
                    false,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(0.2, 0.2),
                          blurRadius: 1,
                          spreadRadius: 0.5,
                        ), //BoxShadow
                      ],
                    ),
                    padding: const EdgeInsets.all(3.0),
                    margin: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: _passwordTextEditingController,
                      obscureText: _isObscure,
                      cursorColor: Theme.of(context).primaryColor,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.person,
                          color: Theme.of(context).primaryColor,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Theme.of(context).primaryColor,
                          ),
                          onPressed: () {
                            _toggle();
                          },
                        ),
                        focusColor: Theme.of(context).primaryColor,
                        hintText: "Password",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0),
            child: ElevatedButton(
              onPressed: () {
                _emailTextEditingController.text.isNotEmpty &&
                    _passwordTextEditingController.text.isNotEmpty
                    ? loginUser()
                    : showDialog(
                    context: context,
                    builder: (c) {
                      return const ErrorAlertDialog(
                        message: "Please write Email and Password.",
                      );
                    });
              },
              style: ElevatedButton.styleFrom(
                primary: kPrimaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                minimumSize: Size(_screenWidth/1.2, 50),
              ),
              child: const Text(
                "Login",
                style: TextStyle(
                    color: kBackgroundColor,
                    fontSize: 17,
                    fontFamily: 'MonoBold'),
              ),
            ),
          ),
          const SizedBox(
            height: 40.0,
          ),
          TextButton(
            child: const Text(
              'Forgot Password?',
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ResetPass()),
            ),
          ),
          Container(
            height: 2.0,
            width: _screenWidth * 0.4,
            color: kBackgroundColor,
          ),
          const SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void loginUser() async {
    showDialog(
        context: context,
        builder: (c) {
          return const LoadingAlertDialog(
            message: "Authenticating, Please wait...",
          );
        });
    User firebaseUser;
    await _auth
        .signInWithEmailAndPassword(
      email: _emailTextEditingController.text.trim(),
      password: _passwordTextEditingController.text.trim(),
    )
        .then((authUser) {
      firebaseUser = authUser.user!;
      readData(firebaseUser).then((s) {
        Navigator.pop(context);
        Route route = MaterialPageRoute(builder: (c) => const HomeScreen());
        Navigator.pushReplacement(context, route);
      });
    }).catchError((error) {
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (c) {
            return ErrorAlertDialog(
              message: error.message.toString(),
            );
          });
    });
  }

  Future readData(User fUser) async {
    final SharedPreferences prefs = await _prefs;
    List<String> cartList = [];
    FirebaseFirestore.instance
        .collection("users")
        .doc(fUser.uid)
        .get()
        .then((dataSnapshot) async {
      print(dataSnapshot.data()![EcommerceApp.userUID]);
      await prefs.setString("uid", dataSnapshot.data()![EcommerceApp.userUID]);

      await prefs.setString(
          EcommerceApp.userEmail, dataSnapshot.data()![EcommerceApp.userEmail]);

      await prefs.setString(
          EcommerceApp.userName, dataSnapshot.data()![EcommerceApp.userName]);

      // await prefs.setString(EcommerceApp.userAvatarUrl,
      //     dataSnapshot.data()![EcommerceApp.userAvatarUrl]);

      await FirebaseFirestore.instance
          .collection("users")
          .doc(fUser.uid)
          .collection("cart")
          .get()
          .then((value) => {
        if (value.docs.isNotEmpty)
          {
            // ignore: avoid_function_literals_in_foreach_calls
            value.docs.forEach((element) {
              WishListModel listModel =
              WishListModel.fromJson(element.data());
              cartList.add(listModel.productId);
            })
          }
      });

      await prefs.setStringList(EcommerceApp.userCartList, cartList);
    });
  }
}
