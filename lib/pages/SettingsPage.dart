
import 'package:flutter/material.dart';
// import 'package:flutter_concert_app/widgets/floating_button.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
            
                ])));
  }
}
