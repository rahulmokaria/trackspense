// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:trackspense/data/data_functions.dart';

import 'package:trackspense/pages/forgot_Password.dart';
import 'package:trackspense/pages/home_page.dart';
import 'package:trackspense/pages/login.dart';
import 'package:trackspense/pages/create_new_expense.dart';
import 'package:trackspense/pages/create_new_income.dart';
import 'package:trackspense/pages/register.dart';
import 'package:trackspense/pages/transaction_page.dart';
import 'package:trackspense/theme/my_theme.dart';

void main() async {
  // add async when using firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      name: 'Trackspense',
      options: const FirebaseOptions(
        apiKey: "AIzaSyB5dWqtpg__F8Gn6KC-oUUUVd3-xahdEG4",
        appId: "1:927172079637:web:bce7c788ef712ecca31e1c",
        messagingSenderId: "927172079637",
        projectId: "trackspense-22aff",
      )).whenComplete(() {
    print("completedAppInitialization");
  });
  initializeVariables();
  runApp(const MyApp());
}

// final db = FirebaseFirestore.instance;
// final cities = db.collection("cities");

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

//   if(FirebaseAuth.instance.currentUser() != null){
//       // wrong call in wrong place!
//       Navigator.of(context).pushReplacement(MaterialPageRoute(
//         builder: (context) => HomeScreen()
//       ));
// }

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      // title: "Trackspense",
      // home: const FlashMessageScreen(),
      // home: const HomePage(),

      initialRoute: (FirebaseAuth.instance.currentUser != null)
          ? 'homePage'
          : 'loginPage',
      routes: {
        'loginPage': (context) => const LoginPage(),
        'registerPage': (context) => const RegisterPage(),
        'homePage': (context) => const HomePage(),
        'transactionPage': (context) => const TransactionPage(),
        'newIncome': (context) => const CreateNewIncome(),
        'newExpense': (context) => const CreateNewExpense(),
        'forgotPasswordPage': (context) => const ForgotPasswordPage(),
      },
    );
  }
}

// class AddData extends StatelessWidget {
//   const AddData({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("geeks"),
//       ),
//       body: Center(
//         child: FloatingActionButton(onPressed: () {
//           final data1 = <String, dynamic>{
//             "name": "San Francisco",
//             "state": "CA",
//             "country": "USA",
//             "capital": false,
//             "population": 860000,
//             "regions": ["west_coast", ""]
//           };
//           cities.doc("SF").set(data1);

//           final data2 = <String, dynamic>{
//             "name": "Los Angeles",
//             "state": "CA",
//             "country": "USA",
//             "capital": false,
//             "population": 3900000,
//             "regions": ["west_coast", ""],
//           };
//           cities.doc("LA").set(data2);

//           final data3 = <String, dynamic>{
//             "name": "Washington D.C.",
//             "state": null,
//             "country": "USA",
//             "capital": true,
//             "population": 680000,
//             "regions": ["east_coast"]
//           };
//           cities.doc("DC").set(data3);

//           final data4 = <String, dynamic>{
//             "name": "Tokyo",
//             "state": null,
//             "country": "Japan",
//             "capital": true,
//             "population": 9000000,
//             "regions": ["", "honshu"]
//           };
//           cities.doc("TOK").set(data4);

//           final data5 = <String, dynamic>{
//             "name": "Beijing",
//             "state": null,
//             "country": "China",
//             "capital": true,
//             "population": 21500000,
//             "regions": ["", "hebei"],
//           };
//           cities.doc("BJ").set(data5);
//           FirebaseFirestore.instance
//               .collection('')
//               .add({'text': 'data added through app'});
//         }),
//       ),
//     );
//   }

//   void getData() {
//     final docRef = db.collection('cities').doc("SF");
//     docRef.get().then(
//       (DocumentSnapshot doc) {
//         final data = doc.data() as Map<String, dynamic>;
// //...
//       },
//       onError: (e) => print("Error getting document : $e"),
//     );
//   }
// }
