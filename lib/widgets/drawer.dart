import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trackspense/theme/colors.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_svg_provider/flutter_svg_provider.dart';

Drawer sideDrawer(
  BuildContext context,
  String userName,
  String userEmail,
  String image,
) {
  return Drawer(
    child: Container(
      color: secondary,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            margin: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: primary.withAlpha(100),
                borderRadius: BorderRadius.circular(10),
                // borderRadius: BorderRadius.all(10),
              ),
              accountEmail: Text(userEmail),
              accountName: Text(userName),
              currentAccountPicture: const CircleAvatar(
                // backgroundImage: Svg('assets/images/profilePictures/owl.svg'),
                backgroundImage: AssetImage('assets/images/koala.png'),
                radius: 50,
              ),
            ),
          ),
          ListTile(
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushNamed(context, 'login');
            },
            contentPadding: const EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            title: const Text(
              "Log Out",
              textScaleFactor: 1.2,
              style: TextStyle(
                color: white,
              ),
            ),
            // tileColor: primary.withAlpha(90),
            // hoverColor: primary.withAlpha(255),
            trailing: const Icon(
              Icons.logout,
              color: white,
            ),
            // onTap: (){
            //   Navigator.push(context, 'login');
            // },           //add when firebase starts working
          )
        ],
      ),
    ),
  );
}
