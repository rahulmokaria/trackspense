import 'package:flutter/material.dart';
import 'package:trackspense/theme/colors.dart';

transactionBox(
  DateTime date, {
  String remark = "Tarbuj watermelon and something",
  String cat = "Food",
  num amount = -100,
  num balance = 10000,
  bool type = true,
}) {
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
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Text(
            remark,
            // overflow: TextOverflow.visible,
            textScaleFactor: 1.75,
            style: const TextStyle(
              color: white,
            ),
          ),
        ),
        // const SizedBox(
        //   height: 10,
        // ),
        const Divider(
          color: secondary,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                (amount < 0)
                    ? Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: secondary,
                        ),
                        child: Text(
                          cat,
                          textScaleFactor:1.2,
                          style: const TextStyle(
                            color: white,
                          ),
                        ),
                      )
                    : Text(""),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  date.day.toString() +
                      " " +
                      textMonth(date.month) +
                      " " +
                      date.year.toString(),
                  style: const TextStyle(
                    color: white,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Balance: " + balance.toString(),
                  style: const TextStyle(
                    color: white,
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (amount >= 0) ? primary : primaryContrast,
              ),
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Text(
                  (amount >= 0) ? "+" + amount.toString() : amount.toString(),
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
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: [
    //       Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         // mainAxisAlignment: MainAxisAlignment.start,
    //         children: [
    //           Text(
    //             remark,
    //             overflow: TextOverflow.visible,
    //             textScaleFactor: 1.75,
    //             style: const TextStyle(
    //               color: white,
    //             ),
    //           ),

    //           // const SizedBox(
    //           //   height: 15,
    //           // ),
    //           SizedBox(
    //             width: 150,
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               // crossAxisAlignment: CrossAxisAlignment.stretch,
    //               children: [
    //                 Text(
    //                   cat,
    //                   textAlign: TextAlign.left,
    //                   // textScaleFactor: 1.2,
    //                   style: const TextStyle(
    //                     decorationColor: Color.fromARGB(255, 40, 75, 95),
    //                     color: white,
    //                   ),
    //                 ),
    //                 Text(
    //                   date.day.toString() +
    //                       " " +
    //                       textMonth(date.month) +
    //                       " " +
    //                       date.year.toString(),
    //                   style: const TextStyle(
    //                     color: white,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           const SizedBox(
    //             height: 5,
    //           ),
    //           Text(
    //             "Balance: " + balance.toString(),
    //             style: const TextStyle(
    //               color: white,
    //             ),
    //           ),
    //         ],
    //       ),
    //       Container(
    //         decoration: BoxDecoration(
    //           shape: BoxShape.circle,
    //           color: (amount >= 0) ? primary : primaryContrast,
    //         ),
    //         padding: const EdgeInsets.all(20),
    //         child: Center(
    //           child: Text(
    //             (amount >= 0) ? "+" + amount.toString() : amount.toString(),
    //             textScaleFactor: 1.2,
    //             style: const TextStyle(
    //               color: white,
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
  );
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
