import 'package:flutter/material.dart';

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
      onTap: onPress,  
      leading: Container(
        width: 40, height:40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(255, 139, 206, 225)
        ),
        child: Icon(icon, color: Colors.black),
      ),
      title: Text(title, style: Theme.of(context).textTheme.bodyText1?.apply(color:textColor)),
      trailing: endIcon? Container(
        width: 40, height:40,
        child: IconButton(onPressed: null, icon: Icon(Icons.chevron_right)
        // const ImageIcon(
        //   AssetImage("assets/noun-chevron-1906647.png"),
        //   color: Colors.red,
        //   size: 24,
        // )
      ),
    ) : null,
    
  
                ),);
  }
}