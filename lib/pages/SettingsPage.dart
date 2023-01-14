
import 'package:flutter/material.dart';
// import 'package:flutter_concert_app/widgets/floating_button.dart';

const String tProfileImage = "assets/loginImage2.png";
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
          color: Colors.blue,
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height:25),
                  Row(
                    children: [
                      SizedBox(
                        width:90, height: 90,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(image: AssetImage(tProfileImage),)),
                      ),
                      Column(
                        children: [
                          Text('Marcus Rashford', style: Theme.of(context).textTheme.headline6),
                          SizedBox(height: 20),
                          Text('mrashfordmba@gmail.com', style: Theme.of(context).textTheme.bodyText2) 
                        ],
                      )
                    ],
                  )

                  // ignore: avoid_unnecessary_containers
                  
                ])));



  
  }
}

