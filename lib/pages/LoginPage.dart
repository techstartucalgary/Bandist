import 'package:flutter/material.dart';
// import 'package:flutter_concert_app/widgets/floating_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        // resizeToAvoidBottomPadding: false,
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Center(child: Container(
                    padding: EdgeInsets.fromLTRB(15.0, 70.0, 0.0, 0.0),
                    child: Text(
                      'BANDIST',
                      style:
                          TextStyle(fontSize: 70.0, fontWeight: FontWeight.bold),
                    ),
                  ),),
                ],
              ),
            ),
            //SizedBox(height: 20.0),
            Expanded(
              child: Container(
                child: Image(image: AssetImage('assets/loginImage2.png')),
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 0.0, left: 20.0, right: 20.0, bottom: 20.0),
                child: Column(
                  children: <Widget>[
                    Container(
                        height: 50.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.blueAccent,
                          color: Color.fromRGBO(84, 159, 204, 1),
                          elevation: 7.0,
                          child: GestureDetector(
                            onTap: () {},
                            child: Center(
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
                    SizedBox(height: 25.0),
                    Container(
                        height: 50.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.blueAccent,
                          color: Color.fromRGBO(84, 159, 204, 1),
                          elevation: 7.0,
                          child: GestureDetector(
                            onTap: () {},
                            child: Center(
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
                    SizedBox(height: 20.0),
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
                          child: Center(
                            child: Text('GO BACK',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat')),
                          ))))]))])));
  }
}