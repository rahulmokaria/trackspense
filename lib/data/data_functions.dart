import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trackspense/theme/my_theme.dart';
import 'package:trackspense/widgets/show_error.dart';

final db = FirebaseFirestore.instance;
final auth = FirebaseAuth.instance;
final currentUser = FirebaseAuth.instance.currentUser;
// final userDocRef = db.doc("users/rahulmokaria.rm@gmail.com");

String? userEmail = currentUser!.email;

final userDocRef = db.collection('data').doc(userEmail);

String? userName = "";

String userImage = "assets/images/panda.png";
double totalExpense = 0;
double totalIncome = 0;
double balance = 0;

// FirebaseFirestore.instance.collection('data').doc(userEmail).
initializeVariables() {
  db
      .collection("data")
      .where("email", isEqualTo: userEmail)
      .snapshots()
      .listen((event) {
    for (var doc in event.docs) {
      userName = doc.data()["name"];
      userImage = doc.data()["image"];
      totalExpense = doc.data()["totalExpense"];
      totalIncome = doc.data()["totalIncome"];
      balance = doc.data()["balance"];
    }
    // print("Balance: $balance");
  });
}

changeImageDb(String newImage) {
  final data = {"image": newImage};
  userDocRef.update(data);
}

registerNewUserDb(
  context,
  _emailTextController,
  _passwordTextController,
  _userNameTextController,
) {
  auth
      .createUserWithEmailAndPassword(
          email: _emailTextController.text,
          password: _passwordTextController.text)
      .then((value) {
    Navigator.pushNamed(context, 'homePage');
  }).onError((error, stackTrace) {
    ScaffoldMessenger.of(context).showSnackBar(showError(
        "Oh Snap!",
        error.toString(),
        primaryContrast,
        CupertinoIcons.exclamationmark_circle));
  });
  FirebaseFirestore.instance
      .collection('data')
      .doc(_emailTextController.text)
      .set({
    'name': _userNameTextController.text,
    'email': _emailTextController.text,
    'totalExpense': 0.0,
    'totalIncome': 0.0,
    'balance': 0.0,
    'image': 'assets/images/panda.png',
    'categories': {
      'Food': 0,
      'Shopping': 0,
      'Medicines': 0,
      'Transport': 0,
      'Utilities': 0,
      'Education': 0,
      'Entertainment': 0,
      'Clothing': 0,
      'Rent': 0,
      'Others': 0,
    }
  });
}

loginUserDb(context, _emailTextController, _passwordTextController) {
  auth
      .signInWithEmailAndPassword(
          email: _emailTextController.text,
          password: _passwordTextController.text)
      .then((value) {
    Navigator.pushNamed(context, 'homePage');
  }).onError((error, stackTrace) {
    ScaffoldMessenger.of(context).showSnackBar(showError(
        "Oh Snap!",
        error.toString(),
        primaryContrast,
        CupertinoIcons.exclamationmark_circle));
  });
}

// class UserDetails {
//   String userEmail;
//   String userName;
//   String userImage;
//    double totalExpense;
//    double totalIncome;
// }

newTransactionDb(
    double amount, String remark, String cat, DateTime date, double balance) {
  FirebaseFirestore.instance
      .collection("data")
      .doc(userEmail)
      .collection('transactions')
      .add({
    "amount": amount,
    "remark": remark,
    "category": cat,
    "date": date,
    "balance": balance,
  });
}

newIncomeDb() {
  db
      .collection("cities")
      .where("email", isEqualTo: userEmail)
      .snapshots()
      .listen((event) {
    for (var doc in event.docs) {}
  });
}

// updateBalanceDb() {}
// updateTotalIncomeDb() {}
// updateTotalExpenseDb() {}
totalCategoryUpdateDb(cat) {}

class ChartData {
  ChartData(
    this.index,
    this.x,
    this.y,
    this.color,
  );
  var index;
  final String x;
  final double y;
  final Color color;
}

var catValue = {};

getCatData() {
  db
      .collection('data')
      .where("email", isEqualTo: userEmail)
      .snapshots()
      .listen((event) {
    for (var doc in event.docs) {
      catValue = doc.data()["categories"];
    }
  });
}

final List<ChartData> chartData = [
  ChartData(
    0,
    'Food',
    catValue["Food"],
    const Color.fromARGB(255, 249, 65, 68),
  ),
  ChartData(
    1,
    'Shopping',
    catValue["Shopping"],
    const Color.fromARGB(255, 243, 114, 44),
  ),
  ChartData(
    2,
    'Medicines',
    catValue["Medicines"],
    const Color.fromARGB(255, 248, 150, 30),
  ),
  ChartData(
    3,
    'Transport',
    catValue["Transport"],
    const Color.fromARGB(255, 249, 132, 74),
  ),
  ChartData(
    4,
    'Utilities',
    catValue["Utilities"],
    const Color.fromARGB(255, 249, 199, 79),
  ),
  ChartData(
    5,
    'Education',
    catValue["Education"],
    const Color.fromARGB(255, 144, 190, 109),
  ),
  ChartData(
    6,
    'Entertainment',
    catValue["Entertainment"],
    const Color.fromARGB(255, 67, 170, 139),
  ),
  ChartData(
    7,
    'Clothing',
    catValue["Clothing"],
    const Color.fromARGB(255, 77, 144, 142),
  ),
  ChartData(
    8,
    'Rent',
    catValue["Rent"],
    const Color.fromARGB(255, 87, 117, 144),
  ),
  ChartData(
    9,
    'Others',
    catValue["Others"],
    const Color.fromARGB(255, 39, 125, 161),
  ),
];

class MyTransaction {
  MyTransaction(this.amount, this.remark, this.category, this.balance,
      this.transactionDate);
  String remark;
  String category;
  double balance;
  DateTime transactionDate;
  double amount;
}

List<MyTransaction> transactions = [
  // db.collection("data").where("email",isEqualTo: userEmail).snapshots().listen((event) {});
  // MyTransaction(
  //   amount: -100,
  //   remark:
  //       "Tarbuj water cfbdouvvhdffi  fnggbkrv sdljk nclbnfglkvvds kxk fglb fdkv sd lkdnbk melon and something",
  //   category: "Entertainment",
  //   balance: 1000,
  //   transactionDate: DateTime.now(),
  // ),
  // MyTransaction(
  //     amount: 10,
  //     balance: 1000,
  //     category: 'sdidfgscvcy',
  //     remark: 'Fees',
  //     transactionDate: DateTime.now()),
];



// createTransactionList() {
//   db
//       .collection("data")
//       .where("email", isEqualTo: userEmail).collection("transactions")
//       .snapshots()
//       .listen((event) {
//         for(var doc in event.docs){
//           transactions.add(
//             doc.collection("transactions")
//           );
//         }
//       });
// }
