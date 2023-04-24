// ignore_for_file: sort_child_properties_last, file_names
import 'package:flutter/material.dart';
import 'package:flutter_concert_app/constants/ColorConstants.dart';
import 'package:flutter_concert_app/widgets/profile_menu.dart';
import '../widgets/home page/Header.dart';
import 'EditProfile.dart';

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
        color: Color.fromARGB(255, 245, 241, 241),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned(
                right: 0,
                child: Image.asset('assets/images/blob3.png'),
              ),
              Positioned(
                top: 300,
                child: Image.asset('assets/images/blob4.png'),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset('assets/images/blob1.png'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 70,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                          ),
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
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SettingsMenu(
                      title: "Edit Profile",
                      icon: const IconData(
                        0xe57f,
                        fontFamily: 'MaterialIcons',
                      ),
                      textColor: Colors.black,
                      endIcon: true,
                      onPress: () {},
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SettingsMenu(
                      title: "Language",
                      icon: const IconData(
                        0xe366,
                        fontFamily: 'MaterialIcons',
                      ),
                      textColor: Colors.black,
                      endIcon: true,
                      onPress: () {},
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SettingsMenu(
                      title: "Notification",
                      icon: const IconData(
                        0xe44f,
                        fontFamily: 'MaterialIcons',
                      ),
                      textColor: Colors.black,
                      endIcon: true,
                      onPress: () {},
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SettingsMenu(
                      title: "Dark Mode",
                      icon: const IconData(
                        0xf065d,
                        fontFamily: 'MaterialIcons',
                      ),
                      textColor: Colors.black,
                      endIcon: true,
                      onPress: () {},
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SettingsMenu(
                      title: "FAQs",
                      icon: const IconData(
                        0xe4fa,
                        fontFamily: 'MaterialIcons',
                      ),
                      textColor: Colors.black,
                      endIcon: true,
                      onPress: () {},
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SettingsMenu(
                      title: "About App",
                      icon: const IconData(
                        0xe33c,
                        fontFamily: 'MaterialIcons',
                      ),
                      textColor: Colors.black,
                      endIcon: true,
                      onPress: () {},
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SettingsMenu(
                      title: "Privacy",
                      icon: const IconData(
                        0xeaaa,
                        fontFamily: 'MaterialIcons',
                      ),
                      textColor: Colors.black,
                      endIcon: true,
                      onPress: () {
                        Navigator.of(context).pushNamed('/privacy');
                      },
                    ),
                    const SizedBox(
                      height: 170,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
