import 'package:flutter/material.dart';
import '../../constants/ColorConstants.dart';

class SmallButton extends StatelessWidget {
  const SmallButton({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.0,
      width: 60,
      child: Material(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(15.0),
        elevation: 3.0,
        child: TextButton(
          onPressed: () => Navigator.of(context).pushNamed('/concerts'),
          child: Center(
            child: Text(
              style: const TextStyle(
                color: Colors.white,
              ),
              text,
            ),
          ),
        ),
      ),
    );
  }
}
