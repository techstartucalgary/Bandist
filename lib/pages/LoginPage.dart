import 'package:flutter/material.dart';
// import 'package:flutter_concert_app/widgets/floating_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
            // ignore: avoid_unnecessary_containers
            Container(
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Container(
                    padding: const EdgeInsets.fromLTRB(15.0, 70.0, 0.0, 0.0),
                    child: const Text(
                      'BANDIST',
                      style:
                          TextStyle(fontSize: 70.0, fontWeight: FontWeight.bold),
                    ),
                    ),
                  ),
                ],
              ),
            ),
            //SizedBox(height: 20.0),
            // ignore: prefer_const_constructors
            Expanded(
              child: const Image(
                image: AssetImage('assets/loginImage2.png')),
            ),
            Container(
                padding: const EdgeInsets.only(top: 0.0, left: 20.0, right: 20.0, bottom: 20.0),
                child: Column(
                  children: <Widget>[
                    // ignore: sized_box_for_whitespace
                    Container(
                        height: 50.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.blueAccent,
                          color: const Color.fromRGBO(84, 159, 204, 1),
                          elevation: 7.0,
                          child: GestureDetector(
                            onTap: () {},
                            child: const Center(
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                        )),
                    const SizedBox(height: 25.0),
                    Container(
                        height: 50.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.blueAccent,
                          color: const Color.fromRGBO(84, 159, 204, 1),
                          elevation: 7.0,
                          child: GestureDetector(
                            onTap: () {},
                            child: const Center(
                              child: Text(
                                'SIGNUP',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                        )),
                    const SizedBox(height: 20.0),
                    Container(
                      height: 50.0,
                      color: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black,
                                style: BorderStyle.solid,
                                width: 1.0),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: const Center(
                            child: Text('GO BACK',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat')),
                          )
                        )
                      )
                    )
                  ]
                )
            )]
          )
        )
    );
  }
}