// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:trackspense/pages/forgot_Password.dart';
import 'package:trackspense/pages/home_page.dart';
import 'package:trackspense/pages/login.dart';
import 'package:trackspense/pages/create_new_expense.dart';
import 'package:trackspense/pages/create_new_income.dart';
import 'package:trackspense/pages/register.dart';
import 'package:trackspense/pages/transaction_page.dart';
import 'package:trackspense/theme/my_theme.dart';
import 'package:trackspense/widgets/change_image_widget.dart';
import 'package:trackspense/widgets/pie_chart.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      name: 'Trackspense',
      options: const FirebaseOptions(
        apiKey: "AIzaSyB5dWqtpg__F8Gn6KC-oUUUVd3-xahdEG4",
        appId: "1:927172079637:web:bce7c788ef712ecca31e1c",
        messagingSenderId: "927172079637",
        projectId: "trackspense-22aff",
      )).whenComplete(() {});
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
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
        'pieChart': (context) => PieChart(showIndex: 0),
        'changeImage': (context) => ChangeImageWidget(context),
      },
    );
  }
}
