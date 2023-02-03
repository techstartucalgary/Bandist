import 'package:flutter/material.dart';
import 'package:flutter_concert_app/constants/ColorConstants.dart';
import 'package:url_launcher/url_launcher.dart';

class FloatingButton extends StatelessWidget {
  
  FloatingButton({
    this.rotation = 0,
    required this.text,
    this.textColor = Colors.white,
    this.boxColor = kPrimaryColor,
    this.shadowColor = Colors.blueAccent,
    this.fontFamily = 'Montserrat',
    this.fontWeight = FontWeight.bold,
    this.url = 'https://www.spotify.com/us/signup?forward_url=https%3A%2F%2Fopen.spotify.com%2F'
  });

  final int rotation;
  String text;
  final Color textColor;
  final Color boxColor;
  final Color shadowColor;
  final FontWeight fontWeight;
  final String fontFamily;
  String url;

  launchURL(String url) async{
    if (await launch(url)){

    }else{
      throw 'could not launch $url';
    }
  }
  

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
              onTap: () {
                
                launchURL(url);
                
              },
              child: Center(
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
  }}