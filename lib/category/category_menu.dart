import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop_app/model/item.dart';
import 'package:e_shop_app/view_more_screen/category_screen_model.dart';
import 'package:e_shop_app/view_more_screen/see_all_plants.dart';
import 'package:e_shop_app/view_more_screen/indoor_user_list.dart';
import 'package:e_shop_app/view_more_screen/outdoor_user_list.dart';
import 'package:e_shop_app/view_more_screen/plant_containers.dart';
import 'package:e_shop_app/view_more_screen/table_plant_list.dart';
import 'package:e_shop_app/widgets/colors.dart';
import 'package:flutter/material.dart';

class CategoryMenu extends StatefulWidget {
  @override
  _CategoryMenuState createState() => _CategoryMenuState();
}

class _CategoryMenuState extends State<CategoryMenu> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 12.0, bottom: 5.0),
            child: Container(
              child: const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Categories",
                  style: TextStyle(
                      fontSize: 20, fontFamily: "SFCMed", color: kTextColor),
                ),
              ),
            ),
          ),
          Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 12.0, bottom: 8.0, top: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        gradient: const LinearGradient(
                          colors: [Colors.green, kPrimaryColor],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                        ),
                      ),
                      width: 75,
                      height: 75,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: TextButton(
                            onPressed: () {
                              Route route = MaterialPageRoute(
                                  builder: (c) => IndoorPlantUserList());
                              Navigator.push(context, route);
                            },
                            child: const Text(
                              'Indoor Plants',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "SFCMed",
                                  color: kBackgroundColor),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 12.0, bottom: 8.0, top: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        gradient: const LinearGradient(
                          colors: [Colors.green, kPrimaryColor],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                        ),
                      ),
                      width: 75,
                      height: 75,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: TextButton(
                            onPressed: () {
                              Route route = MaterialPageRoute(
                                  builder: (c) => OutdoorPlantUserList());
                              Navigator.push(context, route);
                            },
                            child: const Text(
                              'Outdoor Plants',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "SFCMed",
                                  color: kBackgroundColor),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 12.0, bottom: 8.0, top: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        gradient: const LinearGradient(
                          colors: [Colors.green, kPrimaryColor],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                        ),
                      ),
                      width: 75,
                      height: 75,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: TextButton(
                            onPressed: () {
                              Route route = MaterialPageRoute(
                                  builder: (c) => TablePlantUserList());
                              Navigator.push(context, route);
                            },
                            child: Text(
                              'Find For Table',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "SFCMed",
                                  color: kBackgroundColor),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10.0, bottom: 8.0, top: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        gradient: const LinearGradient(
                          colors: [Colors.green, kPrimaryColor],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                        ),
                      ),
                      width: 75,
                      height: 75,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: TextButton(
                            onPressed: () {
                              Route route = MaterialPageRoute(
                                  builder: (c) => PlantContainers());
                              Navigator.push(context, route);
                            },
                            child: Text(
                              'Pots for Plants',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "SFCMed",
                                  color: kBackgroundColor),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 12.0, bottom: 8.0, top: 8.0, right: 12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        gradient: const LinearGradient(
                          colors: [Colors.green, kPrimaryColor],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                        ),
                      ),
                      width: 75,
                      height: 75,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(2.0),
                          child: TextButton(
                            onPressed: () {
                              Route route = MaterialPageRoute(
                                  builder: (c) => SeeAllPlants());
                              Navigator.push(context, route);
                            },
                            child: const Text(
                              'See All Plants',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "SFCMed",
                                  color: kBackgroundColor),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
