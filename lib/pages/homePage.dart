import 'package:flutter/material.dart';
import 'package:trackspense/theme/colors.dart';
import 'package:trackspense/widgets/displayTotal.dart';
import 'package:trackspense/widgets/drawer.dart';
import 'package:trackspense/widgets/pieChart.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  @override
  Widget build(BuildContext context) {
    const String userName = "Rahul Mokaria";
    const String userEmail = "rahul.20208102@mnnit.ac.in";
    const String image = "assets/image/profilePicture/owl.svg";
    const double totalExpense = 0;
    const double totalIncome = 0;

    return Scaffold(
      backgroundColor: secondary,
      appBar: AppBar(
        // elevation: 0.0,
        title: const Text('Trackspense'),
        backgroundColor: primary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(30.0),
        children: [
          // transactionBox(DateTime.now()),
          // const SizedBox(
          //   height: 20,
          // ),
          // transactionBox(
          //   DateTime.now(),
          //   remark: 'Kharbuja',
          //   cat: 'Food',
          //   amount: 10,
          // ),
          displayTotal(totalExpense, totalIncome),
          // displayTotal(0.0, 10.0),
          // displayTotal(100.0, 50.0),
          // displayTotal(0.0, 0.0),
          const SizedBox(
            height: 30,
          ),
          // pieChart(),
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
                  // blurRadius: 10.0,
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
                    semanticLabel: 'Text to announce in accessibility modes',
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
      drawer: sideDrawer(context, userName, userEmail, image),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   // child: ,
      // ),
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
                          // fontWeight: FontWeight.bold,
                          color: white,
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
                    //print('called on tap');
                  },
                  child: const SizedBox(
                    child: Center(
                      child: Text(
                        'New Expense',
                        textScaleFactor: 1.3,
                        style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          color: white,
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
