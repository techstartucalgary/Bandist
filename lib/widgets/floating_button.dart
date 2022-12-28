import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  FloatingButton(
    {@required  this.rotation = 0, 
    required this.text ,
    @required this.textColor = Colors.white,
    @required this.boxColor = const Color.fromARGB(255, 84, 186, 204),
    @required this.shadowColor = Colors.blueAccent,
    @required this.fontFamily = 'Montserrat',
    @required this.fontWeight = FontWeight.bold,
  });

  // final onPressed;
  final int rotation;
  String text;
  final Color textColor;
  final Color boxColor;
  final Color shadowColor;
  final FontWeight fontWeight;
  final String fontFamily;


  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: rotation,
      child: Container(
          height: 50.0,
          child: Material(
            borderRadius: BorderRadius.circular(20.0),
            shadowColor: shadowColor,
            color: boxColor,
            elevation: 7.0,
            child: GestureDetector(
              onTap: () {},
              child:  Center(
                child: Text(
                 text,
                  style: TextStyle(
                      color: textColor,
                      fontWeight: fontWeight,
                      fontFamily: fontFamily),
                ),
              ),
            ),
          )),
    );
  }
}
