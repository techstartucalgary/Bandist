
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
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(173, 216, 230, 150),
                Color.fromRGBO(158, 201, 215, 5),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            )
          ),
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
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
                      Padding(padding: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Marcus Rashford', style: Theme.of(context).textTheme.headline6),
                          SizedBox(height: 10,),
                          Text('mrashfordmba@gmail.com', style: Theme.of(context).textTheme.bodyText2)
                        ],
                      )),
                      Padding(padding: EdgeInsets.only(left: 45),
                      child: SizedBox(
                        height: 40,
                        width: 30,
                        
                        
                        child:FloatingActionButton(
                        onPressed: (){

                        },
                        child: Icon(Icons.logout_rounded),
                        backgroundColor: Color.fromARGB(255, 228, 85, 8),
                      ))),
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
                  SizedBox(height: 10),
                 SettingsMenu(
                    title: "Language",
                    icon: IconData(0xe366, fontFamily: 'MaterialIcons'),
                    textColor: Colors.black,
                    endIcon: true,
                    onPress: (){},
                    ),
                    SizedBox(height: 10),
                    SettingsMenu(
                      title: "Notification",
                      icon: IconData(0xe44f, fontFamily: 'MaterialIcons'),
                      textColor: Colors.black,
                      endIcon: true,
                      onPress: (){},
                    ),
                    SizedBox(height: 10),
                    SettingsMenu(
                      title: "Dark Mode",
                      icon: IconData(0xf065d, fontFamily: 'MaterialIcons'),
                      textColor: Colors.black,
                      endIcon: true,
                      onPress: (){},
                    ),
                    SizedBox(height: 10),
                    SettingsMenu(
                      title: "Payment Method",
                      icon: IconData(0xe481, fontFamily: 'MaterialIcons'),
                      textColor: Colors.black,
                      endIcon: true,
                      onPress: (){},
                    ),
                    SizedBox(height: 10),
                    SettingsMenu(
                      title: "FAQs",
                      icon: IconData(0xe4fa, fontFamily: 'MaterialIcons'),
                      textColor: Colors.black,
                      endIcon: true,
                      onPress: (){},
                    ),
                    SizedBox(height: 10),
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




