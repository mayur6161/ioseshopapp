import 'package:e_shop_app/widgets/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResetPass extends StatefulWidget {
  const ResetPass({Key? key}) : super(key: key);

  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetPass> {
  late String _email;
  final auth = FirebaseAuth.instance;
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        automaticallyImplyLeading: false,
        title: const Text('Reset Password'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(hintText: 'Write Your Email Address'),
              onChanged: (value) {
                setState(() {
                  _email = value.trim();
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: kPrimaryColor,
                ),
                onPressed: () {
                  setState(() {
                    value = true;
                  });
                  auth.sendPasswordResetEmail(email: _email);
                },
                child: const Text('Send Request', style: TextStyle(fontSize: 16),),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          value == true
              ? const Text(
                  "Email Successfully sent to your registered Email address for resetting the password.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
