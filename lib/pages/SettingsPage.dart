
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
          color: Color.fromARGB(255, 240, 204, 226),
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height:35),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width:70, height: 70,
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
                  const SizedBox(height:40),
                  SettingsMenu(),
                  SizedBox(height:5),         
                  SettingsMenu(),
                  SizedBox(height:5),
                  SettingsMenu(),
                  SizedBox(height:5),
                  SettingsMenu(),
                  SizedBox(height:5),
                  SettingsMenu(),
                  SizedBox(height:5),
                  SettingsMenu(),
                  SizedBox(height:5),
                  SettingsMenu(),
                ])));



  
  }
}

class SettingsMenu extends StatelessWidget {
  const SettingsMenu({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 4000,height: 55,
      decoration: BoxDecoration(
         color: Colors.white,
         borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: ListTile(
      leading: Container(
        width: 40, height:40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(255, 139, 206, 225)
        ),
        child: Icon(IconData(0xe57f, fontFamily: 'MaterialIcons'),color: Colors.black),
      ),
      title: Text('Edit Profile', style: Theme.of(context).textTheme.bodyText1),
      trailing: Container(
        width: 40, height:40,
        child: IconButton(onPressed: null, icon: Icon(Icons.chevron_right)
        // const ImageIcon(
        //   AssetImage("assets/noun-chevron-1906647.png"),
        //   color: Colors.red,
        //   size: 24,
        // )
      ),
    )
  
                ),);
  }
}

