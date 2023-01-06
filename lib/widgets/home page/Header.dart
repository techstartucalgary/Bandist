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
        HomePageAppBar(),
        Container(
          height: size.height * 0.20,
          child: Stack(
            children: [
              Container(
                height: size.height * 0.20 - 27,
                decoration: const BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(30, 0, 20, 0),
                height: size.height * 0.15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hi Name',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Image.asset('assets/images/SplashPageLogo.png')
                  ],
                ),
              ),
              // Positioned(
              //     right: 0,
              //     top: 0,
              //     child: Image.asset('assets/images/SplashPageLogo.png',
              //         height: 90)),
              // const Positioned(
              //     left: 30,
              //     top: 30,
              //     child: Text(
              //       'Hi Name',
              //       style: TextStyle(
              //           fontSize: 30,
              //           fontWeight: FontWeight.bold,
              //           color: Colors.white),
              //     )),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    height: 40,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                              color: kPrimaryColor.withOpacity(0.23)),
                        ],
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: Row(
                        children: [
                          const Expanded(
                            child: TextField(
                                decoration: InputDecoration(
                                    hintText: 'Search',
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none)),
                          ),
                          Icon(
                            Icons.search,
                            color: kPrimaryColor,
                          )
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        )
      ],
    );
  }
}
