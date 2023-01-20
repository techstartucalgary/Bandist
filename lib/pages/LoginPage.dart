import 'package:flutter/material.dart';
import 'package:flutter_concert_app/widgets/components/FloatingButton.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  launchURL(String url) async{
    if (await launchURL(url)){
      await launchURL(url);

    }else{
      throw 'could not launch $url';
    }

  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // ignore: avoid_unnecessary_containers
                  Container(
                    child: Stack(
                      children: <Widget>[
                        Center(
                          child: Container(
                            padding:
                                const EdgeInsets.fromLTRB(15.0, 70.0, 0.0, 0.0),
                            child: const Text(
                              'BANDIST',
                              style: TextStyle(
                                  fontSize: 70.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //SizedBox(height: 20.0),
                  // ignore: prefer_const_constructors

                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: const Image(
                          image: AssetImage('assets/images/loginImage2.png')),
                    ),
                  ),

                  Container(
                      padding: const EdgeInsets.only(
                          top: 0.0, left: 20.0, right: 20.0, bottom: 20.0),
                      child: Column(children: <Widget>[
                        // ignore: sized_box_for_whitespace
                        GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/bottom-bar');
                            },
                            child: FloatingButton(
                              rotation: 0,
                              text: 'LOGIN',
                            )),
                        const SizedBox(height: 25.0),
                        FloatingButton(
                          rotation: 0,
                          text: 'SIGN UP',
                        ),
                      ]))
                ])));
  }
}
