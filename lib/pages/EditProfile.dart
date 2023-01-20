import 'package:flutter/material.dart';
import 'package:iconfont/iconfont.dart';
import 'package:flutter_concert_app/widgets/profile_menu.dart';

class EditProfile extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: SingleChildScrollView(
      child: 
      Column(
        children: [
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 200),
                SizedBox(
                  width: 110, height: 110,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image(image: AssetImage('assets/loginImage2.png'),)),
                         

                  ),

                
              ],
            ),
        ],
      ),
      
      ),
    );
  }
}
