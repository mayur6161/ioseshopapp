import 'dart:async';

import 'package:e_shop_app/Admin/admin_home_screen.dart';
import 'package:e_shop_app/authentication/authenticate_screen.dart';
import 'package:e_shop_app/providers/cart_provider.dart';
import 'package:e_shop_app/providers/change_address.dart';
import 'package:e_shop_app/providers/product_provider.dart';
import 'package:e_shop_app/screens/home_screen.dart';
import 'package:e_shop_app/widgets/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_version/new_version.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (c) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (c) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (c) => AddressChanger(),
        )
      ],
      child: MaterialApp(
        title: 'Go Green Plant Shop',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: kPrimaryColor, fontFamily: 'SFC'),
        home: const SplashScreen(),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  User? user = FirebaseAuth.instance.currentUser;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool? adminLogined;

  Future<void> userData() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      adminLogined = prefs.getBool("adminLogined");
    });
  }

  @override
  void initState() {
    super.initState();
    userData().then((value) => displaySplash());

    final newVersion = NewVersion(
      iOSId: 'com.gogreen.plantshop26',
      androidId: 'com.gogreen.plantshop26',
    );

    const simpleBehavior = false;

    if (simpleBehavior) {
      basicStatusCheck(newVersion);
    } else {
      advancedStatusCheck(newVersion);
    }
  }

  basicStatusCheck(NewVersion newVersion) {
    newVersion.showAlertIfNecessary(context: context);
  }

  advancedStatusCheck(NewVersion newVersion) async {
    final status = await newVersion.getVersionStatus();
    if (status != null) {
      debugPrint(status.releaseNotes);
      debugPrint(status.appStoreLink);
      debugPrint(status.localVersion);
      debugPrint(status.storeVersion);
      debugPrint(status.canUpdate.toString());
      newVersion.showUpdateDialog(
        allowDismissal: false,
        context: context,
        versionStatus: status,
        dialogTitle: "Update Your App",
        updateButtonText: "Update App",
        dismissButtonText: "Close App",
        dialogText: "Please Install Latest Version Of The App from Version " +
            status.localVersion +
            " To Version " +
            status.storeVersion,
        dismissAction: () {
          SystemNavigator.pop();
        },
      );

      // ignore: avoid_print
      print("DEVICE : " + status.localVersion);
      // ignore: avoid_print
      print("STORE : " + status.storeVersion);
    }
  }

  displaySplash() {
    Timer(const Duration(seconds: 1), () async {
      if (user != null) {
        Route route = MaterialPageRoute(builder: (_) => const HomeScreen());
        Navigator.pushReplacement(context, route);
      } else if (adminLogined != null && adminLogined!) {
        Route route =
            MaterialPageRoute(builder: (_) => const AdminHomeScreen());
        Navigator.pushReplacement(context, route);
      } else {
        Route route =
            MaterialPageRoute(builder: (_) => const AuthenticateScreen());
        Navigator.pushReplacement(context, route);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [kPrimaryColor, Colors.green],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: Colors.white, width: 3)),
            height: 150,
            width: 150,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Go Green",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  Text(
                    "Plant Shop",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
