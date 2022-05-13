import 'package:flutter/material.dart';

import 'colors.dart';

class WideButton extends StatelessWidget {
  final String message;
  final Function()? onPressed;

  const WideButton({
    Key? key,
    required this.message,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Center(
        child: InkWell(
          onTap: onPressed,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(50.0),
              ),
              gradient: LinearGradient(
                colors: [kPrimaryColor, Colors.green],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp,
              ),
            ),
            width: MediaQuery.of(context).size.width * 0.85,
            height: 50.0,
            child: Center(
              child: Text(
                message,
                style: const TextStyle(color: kBackgroundColor, fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
