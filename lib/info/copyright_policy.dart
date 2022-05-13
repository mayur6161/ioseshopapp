import 'package:e_shop_app/widgets/colors.dart';
import 'package:flutter/material.dart';

class CopyrightPolicy extends StatelessWidget {
  const CopyrightPolicy({Key? key}) : super(key: key);

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
        title: const Text("Copyright Notice"),
        backgroundColor: kPrimaryColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "© Go Green Plant Shop - 2022",
                style: TextStyle(fontFamily: "SFCMed", fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Except as permitted by the copyright law applicable to you, you may not reproduce or communicate any of the content on this website, including files downloadable from this website, without the permission of the copyright owner."),
              SizedBox(
                height: 10,
              ),
              Text("The owners of copyright in the content on this website may receive compensation for the use of their content by educational institutions and governments, including from licensing schemes managed by Copyright Agency."),
              SizedBox(
                height: 10,
              ),
              Text("We may change these terms of use from time to time. Check before re-using any content from this website."),
              SizedBox(
                height: 10,
              ),


              Text(""),
              SizedBox(
                height: 10,
              ),


              Text(
                "",
                style: TextStyle(fontFamily: "SFCMed", fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
