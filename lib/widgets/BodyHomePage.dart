import 'package:flutter/material.dart';
import 'package:flutter_concert_app/constants/ColorConstants.dart';

class BodyHomePage extends StatelessWidget {
  const BodyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.height * 0.1,
          child: Stack(
            children: [
              Container(
                height: size.height * 0.1 - 27,
                decoration: const BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      height: 40,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 20,
                              offset: Offset(0,10),
                              color: kPrimaryColor.withOpacity(0.23)
                            ),
                          ],
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white)))
            ],
          ),
        )
      ],
    );
  }
}
