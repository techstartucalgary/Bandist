
import 'package:flutter/material.dart';
import 'package:iconfont/iconfont.dart';
import 'package:flutter_concert_app/widgets/profile_menu.dart';
import 'EditProfile.dart';
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
          color: Color.fromARGB(255, 240, 204, 226),
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 11.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height:35),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width:71, height: 71,
                          child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(image: AssetImage(tProfileImage),)),
                      ),
                      Padding(padding: EdgeInsets.only(left: 15),child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Marcus Rashford', style: Theme.of(context).textTheme.headline6),
                          SizedBox(height: 20),
                          Text('mrashfordmba@gmail.com', style: Theme.of(context).textTheme.bodyText2) 
                        ],
                      )),
                      SizedBox(height: 90 , width: 90)
                    ],
                  ),
                  const SizedBox(height:25),
                  SettingsMenu(
                    title: "Edit Profile",
                    icon: IconData(0xe57f, fontFamily: 'MaterialIcons'),
                    textColor: Colors.black,
                    endIcon: true,
                    onPress: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> EditProfile()));
                    },
                  ),
                  SizedBox(height: 5),
                 SettingsMenu(
                    title: "Language",
                    icon: IconData(0xe366, fontFamily: 'MaterialIcons'),
                    textColor: Colors.black,
                    endIcon: true,
                    onPress: (){},
                    ),
                    SizedBox(height: 5),
                    SettingsMenu(
                      title: "Notification",
                      icon: IconData(0xe44f, fontFamily: 'MaterialIcons'),
                      textColor: Colors.black,
                      endIcon: true,
                      onPress: (){},
                    ),
                    SizedBox(height: 5),
                    SettingsMenu(
                      title: "Dark Mode",
                      icon: IconData(0xf065d, fontFamily: 'MaterialIcons'),
                      textColor: Colors.black,
                      endIcon: true,
                      onPress: (){},
                    ),
                    SizedBox(height: 5),
                    SettingsMenu(
                      title: "Payment Method",
                      icon: IconData(0xe481, fontFamily: 'MaterialIcons'),
                      textColor: Colors.black,
                      endIcon: true,
                      onPress: (){},
                    ),
                    SizedBox(height: 5),
                    SettingsMenu(
                      title: "FAQs",
                      icon: IconData(0xe4fa, fontFamily: 'MaterialIcons'),
                      textColor: Colors.black,
                      endIcon: true,
                      onPress: (){},
                    ),
                    SizedBox(height: 5),
                    SettingsMenu(
                      title: "About App",
                      icon: IconData(0xe33c, fontFamily: 'MaterialIcons'),
                      textColor: Colors.black,
                      endIcon: true,
                      onPress: (){},
                    )

                    

                ])));



  
  }
}




