import 'package:flutter/material.dart';
import 'package:flutter_concert_app/widgets/bottomNavigationBar.dart';
import 'package:http/http.dart' as http;
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
    return MaterialApp(
      title: 'Bandist',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
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
      },
    );
  }
}
