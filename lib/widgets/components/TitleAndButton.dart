import 'package:flutter/material.dart';
import 'package:flutter_concert_app/widgets/components/SmallButton.dart';
import 'package:flutter_concert_app/widgets/components/TitleWithUnderline.dart';

class TitleWithButton extends StatelessWidget {
  const TitleWithButton({
    Key? key,
    required this.title,
    required this.press,
    required this.text,
  }) : super(key: key);

  final String title;
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TitleWithUnderline(
            title: title,
          ),
          SmallButton(
            text: text,
            press: press,
          ),
        ],
      ),
    );
  }
}
