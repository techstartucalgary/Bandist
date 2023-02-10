import 'package:flutter/material.dart';
import 'package:flutter_concert_app/constants/ColorConstants.dart';
import 'package:flutter_concert_app/provider/fav_provider.dart';
import 'package:flutter_concert_app/widgets/BottomBar.dart';
import 'package:flutter_concert_app/pages/ConcertsPage.dart';
import 'package:flutter_concert_app/pages/MapsPage.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'pages/HomePage.dart';
import "./pages/LoginPage.dart";

void main() {
  fetchUserOrder();

  runApp(const MyApp());
}

Future<Null> fetchUserOrder() async {
  //receive parameters and pass them either as url
  // Imagine that this function is more complex and slow.
  var url = Uri.https('musicbrainz.org',
      'ws/2/artist/5b11f4ce-a62d-471e-81fc-a69a8278c7da?inc=cnd');
  var response = await http.get(url, headers: {"Accept": 'application/json'});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  return null;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => fav_provider(),
        child: MaterialApp(
          title: 'Bandist',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            backgroundColor: kBackgroundColor,
            scaffoldBackgroundColor: kBackgroundColor,
            primarySwatch: Colors.blue,
            //scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255)
          ),
          home: const LoginPage(),
          routes: {
            // When navigating to the "/" route, build the HomePage widget.
            // When navigating to the "/login" route, build the LoginPage widget.
            '/login': (context) => const LoginPage(),
            '/bottom-bar': (context) => const BottomBar(),
            '/home': (context) => const HomePage(),
            '/concerts': (context) => const ConcertsPage(),
            '/map': (context) => const MapsPage(),
          },
        ));
  }
}
