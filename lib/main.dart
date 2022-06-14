import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:trackspense/pages/homePage.dart';
import 'package:trackspense/pages/login.dart';
import 'package:trackspense/pages/createNewExpense.dart';
import 'package:trackspense/pages/createNewIncome.dart';
import 'package:trackspense/pages/register.dart';
import 'package:trackspense/pages/transactionPage.dart';
import 'package:trackspense/theme/myTheme.dart';

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
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      // themeMode: ThemeMode.light,
      // theme: MyTheme.LightTheme(context),
      initialRoute: 'login',
      routes: {
        'login': (context) => const Login(),
        'register': (context) => const Register(),
        'homePage': (context) => const HomePage(),
        'transactionPage': (context) => const TransactionPage(),
        'newIncome': (context) => const CreateNewIncome(),
        'newExpense': (context) => const CreateNewExpense(),
      },
    );
  }
}
