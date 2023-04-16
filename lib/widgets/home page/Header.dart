import 'package:flutter/material.dart';
import 'package:flutter_concert_app/constants/ColorConstants.dart';
import 'package:flutter_concert_app/widgets/home%20page/HomePageAppBar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.height * 0.15,
          child: Stack(
            children: [
              Container(
                height: size.height * 0.20 - 27,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 214, 151, 151),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(30, 0, 20, 0),
                height: size.height * 0.30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Hi Name',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 232, 221, 221)),
                    ),
                    Image.asset('assets/images/SplashPageLogo.png')
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
