import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:trackspense/data/data_functions.dart';
import 'package:trackspense/data/data_values.dart';
import 'package:trackspense/theme/my_theme.dart';
import 'package:trackspense/widgets/display_total.dart';
import 'package:trackspense/widgets/drawer.dart';
import 'package:trackspense/widgets/pie_chart.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    initializeVariables();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      appBar: AppBar(
        title: const Text('Trackspense'),
        backgroundColor: primary,
      ),
      body: (userName == null)
          ? InkWell(
              onTap: () {
                setState(() {});
              },
              child: const Center(
                  child: CircularProgressIndicator(
                color: white,
              )))
          : ListView(
              padding: const EdgeInsets.all(30.0),
              children: [
                displayTotal(),
                const SizedBox(
                  height: 30,
                ),
                PieChart(
                  showIndex: 0,
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: secondaryLight.withOpacity(0.5),
                        offset: const Offset(
                          10.0,
                          10.0,
                        ),
                        spreadRadius: 2.0,
                      ), //BoxShadow
                      const BoxShadow(
                        color: secondary,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ), //BoxShadow
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: secondaryLight,
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'transactionPage');
                      // showError("Rahul is a cheater");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text(
                          "See All Transactions",
                          textScaleFactor: 1.4,
                          style: TextStyle(color: white),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: white,
                          size: 24.0,
                          semanticLabel:
                              'Text to announce in accessibility modes',
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
      drawer: const SideDrawer(),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10),
        height: 80,
        child: InkWell(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * (9.1 / 20),
                decoration: BoxDecoration(
                  color: primary.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'newIncome');
                  },
                  child: const SizedBox(
                    child: Center(
                      child: Text(
                        'New Income',
                        textScaleFactor: 1.3,
                        style: TextStyle(
                          color: black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * (9.1 / 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: primaryContrast.withOpacity(0.8),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'newExpense');
                  },
                  child: const SizedBox(
                    child: Center(
                      child: Text(
                        'New Expense',
                        textScaleFactor: 1.3,
                        style: TextStyle(
                          color: black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
