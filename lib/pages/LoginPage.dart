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
        // resizeToAvoidBottomPadding: false,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
      Container(
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
              child: Text(
                'EVENTO',
                style: TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),

      ///_______HERE_________
      // decoration: const BoxDecoration(
      //           image: DecorationImage(
      //               image: AssetImage("assets/GenericConcertImage.jpg"),
      //               fit: BoxFit.cover),
      //         ),
      // Center(child: Image(image: AssetImage('assets/GenericConcertImage.jpg'))),

      Container(
          padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                    labelText: 'EMAIL',
                    labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                    // hintText: 'EMAIL',
                    // hintStyle: ,
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(76, 175, 80, 1)))),
              ),
              SizedBox(height: 10.0),
              TextField(
                decoration: InputDecoration(
                    labelText: 'PASSWORD ',
                    labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(76, 175, 80, 1)))),
                obscureText: true,
              ),
              SizedBox(height: 50.0),
              Container(
                  height: 50.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Colors.greenAccent,
                    color: Color.fromRGBO(76, 175, 80, 1),
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
                    shadowColor: Colors.greenAccent,
                    color: Color.fromRGBO(76, 175, 80, 1),
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
                height: 40.0,
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
                    ),
                  ),
                ),
              ),
            ],
          )),
    ]));
  }
}
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Login Page'),
//         elevation: 0,
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(
//                 left: 15.0, right: 15.0, top: 15, bottom: 0),
//             child: Text(
//               'Login with Spotify',
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(
//                 left: 15.0, right: 15.0, top: 15, bottom: 0),
//             child: TextField(
//               controller: _email,
//               keyboardType: TextInputType.emailAddress,
//               enableSuggestions: false,
//               autocorrect: false,
//               textAlign: TextAlign.center,
//               decoration: const InputDecoration(
//                 hintText: "Email",
//               ),
//             ),
//           ),
//           TextField(
//             controller: _password,
//             obscureText: true,
//             enableSuggestions: false,
//             autocorrect: false,
//             textAlign: TextAlign.center,
//             decoration: const InputDecoration(
//               hintText: "Password",
//             ),
//           ),
//           TextButton(
//             onPressed: () async {
//               final email = _email.text;
//               final password = _password.text;
//             },
//             child: const Text("Login"),
//           )
//         ],
//       ),
//     );
//   }
// }
