import 'package:flutter/material.dart';
import 'package:trackspense/theme/colors.dart';
import 'package:trackspense/utils/transaction.dart';
import 'package:trackspense/widgets/transactionBox.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  // String userName = "user Name";
  // String userEmail = "User Email";
  // String image = "assets/image/profilePicture/owl.svg";
  List<Transaction> transactions = [
    Transaction(-100, "Tarbuj watermelon and something", "Entertainment", 1000,
        DateTime.now()),
    Transaction(10, "Fees", "", 1000, DateTime.now()),
    Transaction(-100, "Tarbuj", "Food", 1000, DateTime.now()),
    Transaction(10, "Fees", "", 1000, DateTime.now()),
    Transaction(-100, "Tarbuj", "Food", 1000, DateTime.now()),
    Transaction(10, "Fees", "", 1000, DateTime.now()),
    Transaction(-100, "Tarbuj", "Food", 1000, DateTime.now()),
    Transaction(10, "Fees", "", 1000, DateTime.now()),
    Transaction(-100, "Tarbuj", "Food", 1000, DateTime.now()),
    Transaction(10, "Fees", "", 1000, DateTime.now()),
    Transaction(-100, "Tarbuj", "Food", 1000, DateTime.now()),
    Transaction(10, "Fees", "", 1000, DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      appBar: AppBar(
        // elevation: 0.0,
        title: const Text('Transactions'),
        backgroundColor: primary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(30.0),
        children: [
          for (var data in transactions) ...[
            transactionBox(
              data.transactionDate,
              amount: data.amount,
              remark: data.remark,
              cat: data.category,
              balance: data.balance,
              type: data.amount >= 0,
            ),
            const SizedBox(
              height: 30,
            ),
          ]
        ],
      ),
    );
  }
}
