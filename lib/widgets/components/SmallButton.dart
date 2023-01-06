
import 'package:flutter/material.dart';

import '../../constants/ColorConstants.dart';

class SmallButton extends StatelessWidget {
   SmallButton({Key? key, required this.text, required this.press}) : super(key: key);
  final String text;
 final Function press;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 25.0,
        width: 60,
        child: Material(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(15.0),
          elevation: 2.0,
          child: GestureDetector(
            onTap: (() => press),
            child: Center(
              child: Text(
                style: const TextStyle(color: Colors.white),
                text,
              ),
            ),
          ),
        ));
  }
}
