import 'package:flutter/material.dart';
import 'package:trackspense/data/data_functions.dart';
import 'package:trackspense/data/data_values.dart';
import 'package:trackspense/theme/my_theme.dart';

displayTotal() {
  return Container(
    padding: const EdgeInsets.all(20),
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
    child: Column(
      children: [
        Column(
          children: [
            const Text(
              "Net Balance:",
              textScaleFactor: 1.5,
              style: TextStyle(
                color: white,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: (netBalance! >= 0) ? primary : primaryContrast,
                    offset: const Offset(
                      0.0,
                      0.0,
                    ),
                    blurRadius: 10.0,
                    spreadRadius: 5.0,
                  ), //BoxShadow
                  BoxShadow(
                    color: (netBalance! >= 0) ? primary : primaryContrast,
                    offset: const Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ), //BoxShadow
                ],
              ),
              padding: const EdgeInsets.all(30),
              child: Center(
                child: Text(
                  ((netBalance! > 0) ? (netBalance == 0 ? "" : "+") : "") +
                      netBalance.toString(),
                  textScaleFactor: 1.5,
                  style: const TextStyle(
                    color: white,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total Income:",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: white,
                  ),
                ),
                Text(
                  totalIncome.toString(),
                  textScaleFactor: 1.2,
                  style: const TextStyle(
                    color: primary,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total Expense:",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: white,
                  ),
                ),
                Text(
                  totalExpense.toString(),
                  textScaleFactor: 1.2,
                  style: const TextStyle(
                    color: primaryContrast,
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    ),
  );
}
