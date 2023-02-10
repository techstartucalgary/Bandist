import 'package:flutter/material.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
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
                    child: Center(
                      child: Container(
                        padding:
                            const EdgeInsets.fromLTRB(15.0, 70.0, 0.0, 0.0),
                        child: const Text(
                          'MAPS',
                          style: TextStyle(
                              fontSize: 70.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ])));
  }
}
