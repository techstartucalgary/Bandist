// ignore_for_file: sort_child_properties_last, file_names

import 'package:flutter/material.dart';
import 'package:flutter_concert_app/constants/ColorConstants.dart';
import 'package:flutter_concert_app/widgets/profile_menu.dart';
import 'EditProfile.dart';
// import 'package:flutter_concert_app/widgets/floating_button.dart';

const String tProfileImage = "assets/images/loginImage.png";

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
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [kPrimaryColor, kBackgroundColor],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        )),
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 71,
                  height: 71,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: const Image(
                        image: AssetImage(tProfileImage),
                      )),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Marcus Rashford',
                            style: Theme.of(context).textTheme.headline6),
                        const SizedBox(
                          height: 10,
                        ),
                        Text('mrashfordmba@gmail.com',
                            style: Theme.of(context).textTheme.bodyText2)
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.only(left: 45),
                    child: SizedBox(
                        height: 40,
                        width: 30,
                        child: FloatingActionButton(
                          onPressed: () {},
                          child: const Icon(Icons.logout_rounded),
                          backgroundColor:
                              const Color.fromARGB(255, 228, 85, 8),
                        ))),
              ],
            ),
            const SizedBox(height: 30),
            SettingsMenu(
              title: "Edit Profile",
              icon: const IconData(0xe57f, fontFamily: 'MaterialIcons'),
              textColor: Colors.black,
              endIcon: true,
              onPress: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EditProfile()));
              },
            ),
            const SizedBox(height: 10),
            SettingsMenu(
              title: "Language",
              icon: const IconData(0xe366, fontFamily: 'MaterialIcons'),
              textColor: Colors.black,
              endIcon: true,
              onPress: () {},
            ),
            const SizedBox(height: 10),
            SettingsMenu(
              title: "Notification",
              icon: const IconData(0xe44f, fontFamily: 'MaterialIcons'),
              textColor: Colors.black,
              endIcon: true,
              onPress: () {},
            ),
            const SizedBox(height: 10),
            SettingsMenu(
              title: "Dark Mode",
              icon: const IconData(0xf065d, fontFamily: 'MaterialIcons'),
              textColor: Colors.black,
              endIcon: true,
              onPress: () {},
            ),
            const SizedBox(height: 10),
            SettingsMenu(
              title: "Payment Method",
              icon: const IconData(0xe481, fontFamily: 'MaterialIcons'),
              textColor: Colors.black,
              endIcon: true,
              onPress: () {},
            ),
            const SizedBox(height: 10),
            SettingsMenu(
              title: "FAQs",
              icon: const IconData(0xe4fa, fontFamily: 'MaterialIcons'),
              textColor: Colors.black,
              endIcon: true,
              onPress: () {},
            ),
            const SizedBox(height: 10),
            SettingsMenu(
              title: "About App",
              icon: const IconData(0xe33c, fontFamily: 'MaterialIcons'),
              textColor: Colors.black,
              endIcon: true,
              onPress: () {},
            ),
            const SizedBox(height: 10),
            SettingsMenu(
              title: "Privacy",
              icon: const IconData(0xeaaa, fontFamily: 'MaterialIcons'),
              textColor: Colors.black,
              endIcon: true,
              onPress: () {
                Navigator.of(context).pushNamed('/privacy');
              },
            ),
          ],
        ),
      ),
    );
  }
}
