// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trackspense/data/data_functions.dart';
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
            // SizedBox(
            //   height: 350,
            //   child: DrawerHeader(
            //     margin: EdgeInsets.zero,
            //     child: UserAccountsDrawerHeader(
            //       decoration: BoxDecoration(
            //         color: primary,
            //         borderRadius: BorderRadius.circular(10),
            //       ),
            //       accountEmail: Text(
            //         userEmail!,
            //       ),
            //       accountName: Text(
            //         userName!,
            //         textScaleFactor: 1.2,
            //       ),
            //       currentAccountPicture: CircleAvatar(
            //         backgroundImage: AssetImage(image),
            //         // backgroundImage: SvgPicture("assets/images/koala.png"),
            //         radius: 50,
            //       ),
            //       currentAccountPictureSize: const Size(210, 210),
            //       otherAccountsPictures: <Widget>[
            //         Image.asset("assets/images/bear.png"),
            //         Image.asset("assets/images/bunny.png"),
            //         Image.asset("assets/images/eagle.png"),
            //         Image.asset("assets/images/elephant.png"),
            //         Image.asset("assets/images/fox.png"),
            //         Image.asset("assets/images/giraffe.png"),
            //         Image.asset("assets/images/koala.png"),
            //         Image.asset("assets/images/lion.png"),
            //         Image.asset("assets/images/panda.png"),
            //         Image.asset("assets/images/tiger.png"),
            //       ],
            //     ),
            //   ),
            // ),
            Container(
              // height: 350,
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
                          image: AssetImage(userImage),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(160, 160, 0, 0),
                      child: FloatingActionButton(
                        elevation: 0,
                        backgroundColor: secondary,
                        onPressed: () {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(changeImageWidget(context));
                          Navigator.pop(context);
                          // changeImageWidget();
                        },
                        child: const Icon(
                          Icons.person,
                          color: white,
                        ),
                      ),
                    ),
                    // Container(
                    //   padding: const EdgeInsets.fromLTRB(50, 40, 0, 0),
                    //   decoration: const BoxDecoration(
                    //     shape: BoxShape.circle,
                    //     color: secondary,
                    //   ),
                    //   child: InkWell(
                    //     onTap: () {
                    //       Navigator.pop(context);
                    //       ScaffoldMessenger.of(context)
                    //           .showSnackBar(changeImageWidget());
                    //     },
                    //     child: const Icon(
                    //       Icons.person,
                    //       color: white,
                    //     ),
                    //   ),
                    // )
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
                    // Container(
                    //   decoration: const BoxDecoration(
                    //     shape: BoxShape.circle,
                    //     color: secondary,
                    //   ),
                    //   padding: const EdgeInsets.all(10),
                    //   child: InkWell(
                    //     onTap: () {
                    //       Navigator.pop(context);
                    //       ScaffoldMessenger.of(context)
                    //           .showSnackBar(changeImageWidget());
                    //     },
                    //     child: const Icon(
                    //       Icons.person,
                    //       color: white,
                    //     ),
                    //   ),
                    // )
                  ],
                )
              ]),
            ),
            ListTile(
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                // Navigator.popUntil(context, ModalRoute.withName("login"));
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
}
