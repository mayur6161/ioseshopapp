import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop_app/model/item.dart';
import 'package:e_shop_app/plants_under_list/plants_under_199.dart';
import 'package:e_shop_app/plants_under_list/plants_under_399.dart';
import 'package:e_shop_app/plants_under_list/plants_under_499.dart';
import 'package:e_shop_app/plants_under_list/plants_under_699.dart';
import 'package:e_shop_app/plants_under_list/plants_under_999.dart';
import 'package:e_shop_app/view_more_screen/category_screen_model.dart';
import 'package:e_shop_app/view_more_screen/see_all_plants.dart';
import 'package:e_shop_app/view_more_screen/indoor_user_list.dart';
import 'package:e_shop_app/view_more_screen/outdoor_user_list.dart';
import 'package:e_shop_app/view_more_screen/plant_containers.dart';
import 'package:e_shop_app/view_more_screen/table_plant_list.dart';
import 'package:e_shop_app/widgets/colors.dart';
import 'package:flutter/material.dart';

class PlantUnderMenu extends StatefulWidget {
  @override
  _PlantUnderMenuState createState() => _PlantUnderMenuState();
}

class _PlantUnderMenuState extends State<PlantUnderMenu> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(top:6.0, bottom: 6.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 12.0, bottom: 8.0, top: 8.0, right: 6.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  gradient: const LinearGradient(
                    colors: [kPrimaryColor, Colors.green],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                ),
                width: 110,
                height: 110,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: TextButton(
                      onPressed: () {
                        Route route = MaterialPageRoute(
                            builder: (c) => PlantsUnder999Page());
                        Navigator.push(context, route);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Column(
                          children: const [
                            Text(
                              ' ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: "SFCMed",
                                  color: kBackgroundColor),
                            ),
                            Text(
                              'Plants Under',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 11,
                                  fontFamily: "SFCMed",
                                  color: kBackgroundColor),
                            ),
                            Text(
                              '999',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 37,
                                  fontFamily: "SFCMed",
                                  color: kBackgroundColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 6.0, bottom: 8.0, top: 8.0, right: 6.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  gradient: const LinearGradient(
                    colors: [kPrimaryColor, Colors.green],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                ),
                width: 110,
                height: 110,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: TextButton(
                      onPressed: () {
                        Route route = MaterialPageRoute(
                            builder: (c) => PlantsUnder699Page());
                        Navigator.push(context, route);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Column(
                          children: const [
                            Text(
                              ' ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: "SFCMed",
                                  color: kBackgroundColor),
                            ),
                            Text(
                              'Plants Under',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 11,
                                  fontFamily: "SFCMed",
                                  color: kBackgroundColor),
                            ),
                            Text(
                              '699',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 37,
                                  fontFamily: "SFCMed",
                                  color: kBackgroundColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 6.0, bottom: 8.0, top: 8.0, right: 6.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  gradient: const LinearGradient(
                    colors: [kPrimaryColor, Colors.green],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                ),
                width: 110,
                height: 110,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: TextButton(
                      onPressed: () {
                        Route route = MaterialPageRoute(
                            builder: (c) => PlantsUnder499Page());
                        Navigator.push(context, route);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Column(
                          children: const [
                            Text(
                              ' ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: "SFCMed",
                                  color: kBackgroundColor),
                            ),
                            Text(
                              'Plants Under',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 11,
                                  fontFamily: "SFCMed",
                                  color: kBackgroundColor),
                            ),
                            Text(
                              '499',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 37,
                                  fontFamily: "SFCMed",
                                  color: kBackgroundColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 6.0, bottom: 8.0, top: 8.0, right: 6.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  gradient: const LinearGradient(
                    colors: [kPrimaryColor, Colors.green],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                ),
                width: 110,
                height: 110,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: TextButton(
                      onPressed: () {
                        Route route = MaterialPageRoute(
                            builder: (c) => PlantsUnder399Page());
                        Navigator.push(context, route);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Column(
                          children: const [
                            Text(
                              ' ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: "SFCMed",
                                  color: kBackgroundColor),
                            ),
                            Text(
                              'Plants Under',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 11,
                                  fontFamily: "SFCMed",
                                  color: kBackgroundColor),
                            ),
                            Text(
                              '399',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 37,
                                  fontFamily: "SFCMed",
                                  color: kBackgroundColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 6.0, bottom: 8.0, top: 8.0, right: 12.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  gradient: const LinearGradient(
                    colors: [kPrimaryColor, Colors.green],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                ),
                width: 110,
                height: 110,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: TextButton(
                      onPressed: () {
                        Route route = MaterialPageRoute(
                            builder: (c) => PlantsUnder199Page());
                        Navigator.push(context, route);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Column(
                          children: const [
                            Text(
                              ' ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: "SFCMed",
                                  color: kBackgroundColor),
                            ),
                            Text(
                              'Plants Under',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 11,
                                  fontFamily: "SFCMed",
                                  color: kBackgroundColor),
                            ),
                            Text(
                              '199',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 37,
                                  fontFamily: "SFCMed",
                                  color: kBackgroundColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
