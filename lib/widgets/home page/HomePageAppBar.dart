import 'package:flutter/material.dart';
import 'package:flutter_concert_app/constants/ColorConstants.dart';

class HomePageAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 40,
      elevation: 0,
      backgroundColor: kPrimaryColor,
      leading: Container(
        margin: const EdgeInsets.only(left: 15, top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // IconButton(
            //   icon: const Icon(Icons.menu),
            //   onPressed: () {},
            // ),
            IconButton(
              icon: const Icon(Icons.pin_drop),
              onPressed: () {
                Navigator.pushNamed(context, '/map');
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
