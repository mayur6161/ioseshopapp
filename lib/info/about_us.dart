import 'package:e_shop_app/widgets/colors.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

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
        title: const Text("About Us"),
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
                  "As the years are passing world is going more towards digital"
                  " and by understanding customers need and comfort we have made our move to "
                  "make plant shopping through internet By providing wide range of plants "
                  "with affordable prices.  "),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Go Green Plant Shop is expected to be one of the largest platform of online plant shopping. "
                  "We are here with our best to serve you better.  "),
              SizedBox(
                height: 10,
              ),
              Text(
                  "If you’re looking for something new, you’re in the right place. We strive to be innovative, offering our customers something they want, putting their desires at the top of our priority list. We believe in high quality and exceptional customer service. But most importantly, we believe shopping is a right, not a luxury, so we strive to deliver the best with easy online platform. "),
              SizedBox(
                height: 10,
              ),
              Text("  "),
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
