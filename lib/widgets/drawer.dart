// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trackspense/data/data_functions.dart';
import 'package:trackspense/data/data_values.dart';
import 'package:trackspense/theme/my_theme.dart';
import 'package:trackspense/widgets/change_image_widget.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: secondary,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.fromLTRB(15, 30, 15, 15),
              decoration: BoxDecoration(
                color: primary.withOpacity(0.7),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(children: [
                Stack(
                  children: [
                    Container(
                      height: 220,
                      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(userImage!),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(160, 160, 0, 0),
                      child: FloatingActionButton(
                        elevation: 0,
                        backgroundColor: secondary,
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, 'changeImage');
                        },
                        child: const Icon(
                          Icons.person,
                          color: white,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userName!,
                          textScaleFactor: 1.2,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(userEmail!),
                      ],
                    ),
                  ],
                )
              ]),
            ),
            ListTile(
              onTap: () async {
                await FirebaseAuth.instance.signOut();

                Navigator.pushNamed(context, 'loginPage');
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
              trailing: const Icon(
                Icons.logout,
                color: white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
