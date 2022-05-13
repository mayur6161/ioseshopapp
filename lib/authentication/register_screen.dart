import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop_app/DialogBox/error_dialog.dart';
import 'package:e_shop_app/config/config.dart';
import 'package:e_shop_app/screens/home_screen.dart';
import 'package:e_shop_app/widgets/colors.dart';
import 'package:e_shop_app/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final TextEditingController _nameTextEditingController =
      TextEditingController();
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  final TextEditingController _cPasswordTextEditingController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
          Container(height: 50),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Register Your Account",
              style: TextStyle(
                fontFamily: 'MonoBold',
                color: kBackgroundColor,
                fontSize: 19,
              ),
            ),
          ),
          const SizedBox(
            height: 18.0,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(
                    _nameTextEditingController,
                    Icons.person,
                    "Name",
                    false,
                  ),
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
                      controller: _cPasswordTextEditingController,
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
                        hintText: "Confirm Password",
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
                uploadAndSaveImage();
              },
              style: ElevatedButton.styleFrom(
                primary: kPrimaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                minimumSize: Size(_screenWidth / 1.2, 50),
              ),
              child: const Text(
                "Sign up",
                style: TextStyle(
                    color: kBackgroundColor,
                    fontSize: 17,
                    fontFamily: 'MonoBold'),
              ),
            ),
          ),
          const SizedBox(
            height: 45.0,
          ),
        ],
      ),
    );
  }

  Future<void> uploadAndSaveImage() async {
    _passwordTextEditingController.text == _cPasswordTextEditingController.text
        ? _emailTextEditingController.text.isNotEmpty &&
                _passwordTextEditingController.text.isNotEmpty &&
                _cPasswordTextEditingController.text.isNotEmpty &&
                _nameTextEditingController.text.isNotEmpty
            ? _registerUser()
            : displayDialog("Please fill up the registration complete form..")
        : displayDialog("Password do not match.");
  }

  displayDialog(String msg) {
    showDialog(
        context: context,
        builder: (c) {
          return ErrorAlertDialog(
            message: msg,
          );
        });
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _registerUser() async {
    User? firebaseUser;

    await _auth
        .createUserWithEmailAndPassword(
      email: _emailTextEditingController.text.trim(),
      password: _passwordTextEditingController.text.trim(),
    )
        .then((auth) {
      firebaseUser = auth.user;
    }).catchError((error) {
      showDialog(
          context: context,
          builder: (c) {
            return ErrorAlertDialog(
              message: error.message.toString(),
            );
          });
    });

    if (firebaseUser != null) {
      saveUserInfoToFireStore(firebaseUser).then((value) {
        Route route = MaterialPageRoute(builder: (c) => const HomeScreen());
        Navigator.pushReplacement(context, route);
      });
    }
  }

  Future saveUserInfoToFireStore(User? fUser) async {
    final SharedPreferences prefs = await _prefs;
    FirebaseFirestore.instance.collection("users").doc(fUser!.uid).set({
      "uid": fUser.uid,
      "email": fUser.email,
      "name": _nameTextEditingController.text.trim()
    });

    await prefs.setString("uid", fUser.uid);
    await prefs.setString(EcommerceApp.userEmail, fUser.email ?? "");
    await prefs.setString(
        EcommerceApp.userName, _nameTextEditingController.text);
    await prefs.setStringList(EcommerceApp.userCartList, []);
  }
}
