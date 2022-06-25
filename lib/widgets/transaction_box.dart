import 'package:flutter/material.dart';
import 'package:trackspense/data/data_functions.dart';
import 'package:trackspense/data/data_values.dart';
import 'package:trackspense/theme/my_theme.dart';

Widget transactionBox(UserTransaction transaction) {
  return Container(
    height: 170,
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: secondaryLight,
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
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Text(transaction.remark,
              textScaleFactor: 1.75,
              style: const TextStyle(
                color: white,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis),
        ),
        // const SizedBox(
        //   height: 10,
        // ),
        const Divider(
          color: secondary,
        ),
        // const SizedBox(
        //   height: 10,
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: primary.withAlpha(70),
                  ),
                  child: Text(
                    transaction.category,
                    textScaleFactor: 1.2,
                    style: const TextStyle(
                      color: white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  transaction.transactionDate.day.toString() +
                      " " +
                      textMonth(transaction.transactionDate.month) +
                      " " +
                      transaction.transactionDate.year.toString(),
                  style: const TextStyle(
                    color: white,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Balance: " + transaction.balance.toString(),
                  style: const TextStyle(
                    color: white,
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (transaction.amount >= 0) ? primary : primaryContrast,
              ),
              padding: const EdgeInsets.all(25),
              child: Center(
                child: Text(
                  (transaction.amount >= 0)
                      ? "+" + transaction.amount.toString()
                      : transaction.amount.toString(),
                  textScaleFactor: 1.2,
                  style: const TextStyle(
                    color: white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
