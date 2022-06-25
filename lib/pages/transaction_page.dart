import 'package:flutter/material.dart';

import 'package:trackspense/data/data_functions.dart';
import 'package:trackspense/data/data_values.dart';
import 'package:trackspense/theme/my_theme.dart';
import 'package:trackspense/widgets/transaction_box.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  Widget buildTransaction(UserTransaction transaction) {
    return Column(
      children: [
        transactionBox(transaction),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      appBar: AppBar(
        // elevation: 0.0,
        title: const Text('Transactions'),
        backgroundColor: primary,
      ),
      body: (transactions.isEmpty)
          ? const Center(
              child: Text(
              "No Transactions made",
              textScaleFactor: 1.5,
              style: TextStyle(
                color: white,
              ),
            ))
          : ListView(
              padding: const EdgeInsets.all(30.0),
              children: [
                for (var data in transactions) ...[
                  transactionBox(data),
                  const SizedBox(
                    height: 30,
                  ),
                ]
              ],
            ),
    );
  }
}
