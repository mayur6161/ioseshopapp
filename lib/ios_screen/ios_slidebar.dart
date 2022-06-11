import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_shop_app/widgets/colors.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'ios_authentication_direct.dart';



class IosSlideBar extends StatefulWidget {
  const IosSlideBar({Key? key}) : super(key: key);

  @override
  _IosSlideBarState createState() => _IosSlideBarState();
}

class _IosSlideBarState extends State<IosSlideBar> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 200,
      color: kPrimaryColor.withOpacity(0.1),
      child: CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlay: true,
          ),
          items: [
            InkWell(
              onTap: () {
              },
              child: FutureBuilder(
                  future:
                  _getImage(context, "/sliderimages/one/homeimageone.jpg"),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height / 1,
                        width: MediaQuery.of(context).size.width / 1,
                        child: snapshot.data,
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 70.0, bottom: 70.0),
                        child: Transform.scale(
                            scale: 0,
                            child: const CircularProgressIndicator(
                              valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.green),
                            )),
                      );
                    }
                    return Container();
                  }),
            ),
            InkWell(
              onTap: () {
              },
              child: FutureBuilder(
                  future:
                  _getImage(context, "/sliderimages/two/homeimagetwo.jpg"),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Container(
                        decoration: BoxDecoration(
                          color: kBackgroundColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        height: MediaQuery.of(context).size.height / 1,
                        width: MediaQuery.of(context).size.width / 1,
                        child: snapshot.data,
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 70.0, bottom: 70.0),
                        child: Transform.scale(
                            scale: 0,
                            child: const CircularProgressIndicator(
                              valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.green),
                            )),
                      );
                    }
                    return Container();
                  }),
            ),
            InkWell(
              onTap: () {
              },
              child: FutureBuilder(
                  future: _getImage(
                      context, "/sliderimages/three/homeimagethree.jpg"),
                  //image three change path
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Container(
                        decoration: BoxDecoration(
                          color: kBackgroundColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        height: MediaQuery.of(context).size.height / 1,
                        width: MediaQuery.of(context).size.width / 1,
                        child: snapshot.data,
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 70.0, bottom: 70.0),
                        child: Transform.scale(
                            scale: 0,
                            child: const CircularProgressIndicator(
                              valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.green),
                            )),
                      );
                    }
                    return Container();
                  }),
            ),
            InkWell(
              onTap: () {
              },
              child: FutureBuilder(
                  future: _getImage(
                      context, "/sliderimages/four/homeimagefour.jpg"),
                  //image three change path
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Container(
                        decoration: BoxDecoration(
                          color: kBackgroundColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        height: MediaQuery.of(context).size.height / 1,
                        width: MediaQuery.of(context).size.width / 1,
                        child: snapshot.data,
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 70.0, bottom: 70.0),
                        child: Transform.scale(
                            scale: 0,
                            child: const CircularProgressIndicator(
                              valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.green),
                            )),
                      );
                    }
                    return Container();
                  }),
            ),
          ]),
    );
  }

  Future<Widget> _getImage(BuildContext context, String imageName) async {
    Image image;
    final value = await FireStorageService.loadImage(context, imageName);
    log(value);
    image = Image.network(
      value.toString(),
      fit: BoxFit.fill,
    );
    return image;
  }
}

class FireStorageService extends ChangeNotifier {
  FireStorageService();

  static Future<String> loadImage(BuildContext context, String image) async {
    return await FirebaseStorage.instance.ref().child(image).getDownloadURL();
  }
}
