import 'package:flutter/material.dart';
import 'package:flutter_concert_app/widgets/components/FloatingButton.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late RiveAnimationController _btnAnimationController;
  bool isShowSignInDialog = false;
  @override
  void initState() {
    _btnAnimationController = OneShotAnimation(
      "active",
      autoplay: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConstrainedBox(
        constraints: BoxConstraints(),
        child: Stack(
          children: [
            Positioned(
              width: MediaQuery.of(context).size.width * 1.7,
              left: 100,
              bottom: 100,
              child: Image.asset(
                "assets/Backgrounds/Spline.png",
              ),
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: const SizedBox(),
              ),
            ),
            const RiveAnimation.asset(
              "assets/RiveAssets/shapes.riv",
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                child: const SizedBox(),
              ),
            ),
            AnimatedPositioned(
              top: isShowSignInDialog ? -50 : 0,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              duration: const Duration(milliseconds: 260),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const Spacer(),
                      SizedBox(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              // ignore: avoid_unnecessary_containers
                              Container(
                                child: Stack(
                                  children: <Widget>[
                                    Center(
                                      child: Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            15.0, 70.0, 0.0, 0.0),
                                        child: const Text(
                                          'BANDIST',
                                          style: TextStyle(
                                              fontSize: 70.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Container(
                                padding: const EdgeInsets.all(2),
                                child: const Image(
                                    image: AssetImage(
                                        'assets/images/loginImage.png')),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Container(
                                  padding: const EdgeInsets.only(
                                      top: 0.0,
                                      left: 20.0,
                                      right: 20.0,
                                      bottom: 20.0),
                                  child: Column(children: <Widget>[
                                    // ignore: sized_box_for_whitespace
                                    GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, '/bottom-bar');
                                        },
                                        child: FloatingButton(
                                          rotation: 0,
                                          text: 'LOGIN',
                                        )),
                                  ])),
                                   SizedBox(
                                height: 100,
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
