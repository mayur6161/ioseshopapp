import 'package:e_shop_app/authentication/login_screen.dart';
import 'package:e_shop_app/authentication/register_screen.dart';
import 'package:e_shop_app/widgets/colors.dart';
import 'package:flutter/material.dart';

class AuthenticateScreen extends StatelessWidget {
  const AuthenticateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(150.0),
          child: AppBar(
            automaticallyImplyLeading: false,
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
            title: Column(
              children: [
                Container(
                  height: 10,
                ),
                const Text(
                  "Go Green",
                  style: TextStyle(fontFamily: 'SFCMed', fontSize: 25),
                ),
                const Text(
                  'Plant Shop',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            centerTitle: true,
            bottom: const TabBar(
              labelStyle: TextStyle(fontFamily: 'MonoBold'),
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.lock,
                    color: kBackgroundColor,
                  ),
                  text: "Login",
                ),
                Tab(
                  icon: Icon(
                    Icons.perm_contact_calendar,
                    color: kBackgroundColor,
                  ),
                  text: "Register",
                ),
              ],
              indicatorColor: Colors.white38,
              indicatorWeight: 5.0,
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [kPrimaryColor, Colors.green],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: const TabBarView(
            children: [
              LoginScreen(),
              RegisterScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
