import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trackspense/theme/my_theme.dart';
import 'package:trackspense/widgets/show_error.dart';

final db = FirebaseFirestore.instance;
final auth = FirebaseAuth.instance;
final currentUser = FirebaseAuth.instance.currentUser;

String? userEmail = currentUser!.email;
var catValue = {};
final userDocRef = db.collection('data').doc(userEmail);

String? userName;
String? userImage;
double? totalExpense;
double? totalIncome;
double? netBalance;

class ChartData {
  ChartData({
    required this.index,
    required this.x,
    required this.color,
  });
  var index;
  String x;
  Color color;
}

final List<ChartData> chartData = [
  ChartData(
    index: 0,
    x: 'Food',
    color: const Color.fromARGB(255, 249, 65, 68),
  ),
  ChartData(
    index: 1,
    x: 'Shopping',
    color: const Color.fromARGB(255, 243, 114, 44),
  ),
  ChartData(
    index: 2,
    x: 'Medicines',
    color: const Color.fromARGB(255, 248, 150, 30),
  ),
  ChartData(
    index: 3,
    x: 'Transport',
    color: const Color.fromARGB(255, 249, 132, 74),
  ),
  ChartData(
    index: 4,
    x: 'Utilities',
    color: const Color.fromARGB(255, 249, 199, 79),
  ),
  ChartData(
    index: 5,
    x: 'Education',
    color: const Color.fromARGB(255, 144, 190, 109),
  ),
  ChartData(
    index: 6,
    x: 'Entertainment',
    color: const Color.fromARGB(255, 67, 170, 139),
  ),
  ChartData(
    index: 7,
    x: 'Clothing',
    // y: double.parse(catValue["Clothing"].toString()),
    color: const Color.fromARGB(255, 77, 144, 142),
  ),
  ChartData(
    index: 8,
    x: 'Rent',
    // y: double.parse(catValue["Rent"].toString()),
    color: const Color.fromARGB(255, 87, 117, 144),
  ),
  ChartData(
    index: 9,
    x: 'Others',
    // y: double.parse(catValue["Others"].toString()),
    color: const Color.fromARGB(255, 39, 125, 161),
  ),
];

class UserTransaction {
  UserTransaction({
    required this.amount,
    required this.remark,
    required this.category,
    required this.balance,
    required this.transactionDate,
  });
  String remark;
  String category;
  double balance;
  DateTime transactionDate;
  double amount;

  static UserTransaction fromJson(Map<String, dynamic> json) => UserTransaction(
        amount: json['amount'],
        balance: json['balance'],
        category: json['category'],
        remark: json['remark'],
        transactionDate: (json['date'] as Timestamp).toDate(),
      );
}

List<UserTransaction> transactions = [];
