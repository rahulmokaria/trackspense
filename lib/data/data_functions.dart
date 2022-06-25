import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trackspense/data/data_values.dart';
import 'package:trackspense/theme/my_theme.dart';
import 'package:trackspense/widgets/show_error.dart';

final Stream<QuerySnapshot> data = db.collection("data").snapshots();

Future<void>  initializeVariables() async {
  db
      .collection("data")
      .where("email", isEqualTo: userEmail)
      .snapshots()
      .listen((event) {
    for (var doc in event.docs) {
      userName = doc.data()["name"];
      userImage = doc.data()["image"];
      totalExpense = doc.data()["totalExpense"].toDouble();
      totalIncome = doc.data()["totalIncome"].toDouble();
      netBalance = doc.data()["balance"].toDouble();
    }

    print("categories: $catValue");
    print("Balance: $netBalance");
    print("totalIncome $totalIncome");
    print("totalExpense: $netBalance");
  });

  db
      .collection('data')
      .where("email", isEqualTo: userEmail)
      .snapshots()
      .listen((event) {
    for (var doc in event.docs) {
      catValue = doc.data()["categories"];
    }
    print("categories: $catValue");
    print("${catValue["Food"]}");
  });

  print("categories: $catValue");
  print("Balance: $netBalance");
  print("totalIncome $totalIncome");
  print("totalExpense: $netBalance");
  createTransactionList();
} //initializeVariables

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

newExpenseDb(
  double amount,
  String remark,
  String cat,
  DateTime date,
  double bal,
) {
  db.collection("data").doc(userEmail).collection('transactions').add({
    "amount": -amount,
    "remark": remark,
    "category": cat,
    "date": date,
    "balance": bal,
  });

  print(catValue[cat]);

  db.collection("data").doc(userEmail).update({
    'totalExpense': totalExpense! + amount,
    "balance": bal,
    'categories.${cat}': catValue[cat]! + amount,
  });

  db
      .collection('data')
      .where("email", isEqualTo: userEmail)
      .snapshots()
      .listen((event) {
    for (var doc in event.docs) {
      catValue = doc.data()["categories"];
    }
    print("categories: $catValue");
    print("${catValue["Food"]}");
  });
}

newIncomeDb(
  double amount,
  String remark,
  String cat,
  DateTime date,
  double bal,
) {
  db.collection("data").doc(userEmail).collection("transactions").add({
    "amount": amount,
    "remark": remark,
    "category": cat,
    "date": date,
    "balance": bal,
  });

  db.collection("data").doc(userEmail).update({
    'totalIncome': totalIncome! + amount,
    "balance": bal,
    // 'categories/' + cat: catValue + amount,
  });

  db
      .collection('data')
      .where("email", isEqualTo: userEmail)
      .snapshots()
      .listen((event) {
    for (var doc in event.docs) {
      catValue = doc.data()["categories"];
    }
    print("categories: $catValue");
    print("${catValue["Food"]}");
  });
}

// updateBalanceDb() {}
// updateTotalIncomeDb() {}
// updateTotalExpenseDb() {}

createTransactionList() {
  db
      .collection("data")
      .doc(userEmail)
      .collection("transactions")
      .orderBy("date", descending: true)
      .snapshots()
      .listen((event) {
    for (var doc in event.docs) {
      Map<String, dynamic> map = doc.data();
      DateTime dt = (map['date'] as Timestamp).toDate();
      transactions.add(UserTransaction(
        amount: map["amount"],
        remark: map["remark"],
        category: map["category"],
        balance: map["balance"],
        transactionDate: dt,
      ));
    }
  });

  for (var data in transactions) {
    print("{");
    print("amount :" + data.amount.toString());
    print("remark :" + data.remark);
    print("category :" + data.category);
    print("amount :" + data.balance.toString());
    print("}");
  }
}

textMonth(num month) {
  switch (month) {
    case 1:
      return "January";
    case 2:
      return "February";
    case 3:
      return "March";
    case 4:
      return "April";
    case 5:
      return "May";
    case 6:
      return "June";
    case 7:
      return "July";
    case 8:
      return "August";
    case 9:
      return "September";
    case 10:
      return "October";
    case 11:
      return "November";
    case 12:
      return "December";
  }
}

Stream<List<UserTransaction>> readTransactions() => db
    .collection("data")
    .doc(userEmail)
    .collection("transactions")
    .snapshots()
    .map((snapshot) => snapshot.docs
        .map((doc) => UserTransaction.fromJson(doc.data()))
        .toList());
