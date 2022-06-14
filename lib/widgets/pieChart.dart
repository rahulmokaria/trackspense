import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:trackspense/theme/colors.dart';
import 'package:trackspense/utils/chartData.dart';

var showIndex = 0;
Color highlightColor = secondaryLight;

class PieChart extends StatefulWidget {
  PieChart({Key? key, required this.showIndex}) : super(key: key);
  var showIndex = 0;
  @override
  State<PieChart> createState() => _PieChartState();
}

class _PieChartState extends State<PieChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        children: [
          const Text(
            "Expense Summary:",
            textScaleFactor: 1.4,
            style: TextStyle(color: white),
          ),
          Center(
            child: SfCircularChart(
              series: <CircularSeries>[
                // Renders doughnut chart
                DoughnutSeries<ChartData, String>(
                  dataSource: chartData,
                  pointColorMapper: (ChartData data, _) => data.color,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                  // cornerStyle: CornerStyle.bothCurve,
                  innerRadius: '60%',
                  explode: true,
                  explodeIndex: showIndex,

                  // gap: "3%",

                  animationDuration: 0.0,
                )
              ],
            ),
          ),

          for (var data in chartData) ...[
            Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              height: showIndex == data.index ? 50 : 30,
              // color:data.highlight?primary:secondaryLight,
              decoration: BoxDecoration(
                color: showIndex == data.index ? primary : secondaryLight,
                borderRadius: BorderRadius.circular(7.5),
              ),
              // duration: const Duration(seconds: 10),
              child: InkWell(
                onTap: () {
                  setState() {
                    showIndex = data.index;
                    Navigator.pop(context); // pop current page
                    Navigator.pushNamed(context, "homePage");
                  }
                },
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 30,
                      decoration: BoxDecoration(
                        color: data.color,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      data.x,
                      textScaleFactor: 1.2,
                      style: TextStyle(
                        color: data.highlight ? secondary : white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            )
          ]

          // Row(
          //   children: [
          //     Container(
          //       width: 60,
          //       height: 30,
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(5),
          //         color: const Color.fromARGB(255, 0, 18, 25),
          //       ),
          //     ),
          //     const SizedBox(
          //       width: 20,
          //     ),
          //     const Text(
          //       "Food",
          //       textScaleFactor: 1.2,
          //       style: TextStyle(
          //         color: white,
          //       ),
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }
}

// pieChart() {
//   return Container(
//     padding: const EdgeInsets.all(30),
//     decoration: BoxDecoration(
//       boxShadow: [
//         BoxShadow(
//           color: secondaryLight.withOpacity(0.5),
//           offset: const Offset(
//             10.0,
//             10.0,
//           ),
//           // blurRadius: 10.0,
//           spreadRadius: 2.0,
//         ), //BoxShadow
//         const BoxShadow(
//           color: secondary,
//           offset: Offset(0.0, 0.0),
//           blurRadius: 0.0,
//           spreadRadius: 0.0,
//         ), //BoxShadow
//       ],
//       borderRadius: BorderRadius.circular(10),
//       color: secondaryLight,
//     ),
//     child: Column(
//       children: [
//         const Text(
//           "Expense Summary:",
//           textScaleFactor: 1.4,
//           style: TextStyle(color: white),
//         ),
//         Center(
//           child: SfCircularChart(
//             series: <CircularSeries>[
//               // Renders doughnut chart
//               DoughnutSeries<ChartData, String>(
//                 dataSource: chartData,
//                 pointColorMapper: (ChartData data, _) => data.color,
//                 xValueMapper: (ChartData data, _) => data.x,
//                 yValueMapper: (ChartData data, _) => data.y,
//                 // cornerStyle: CornerStyle.bothCurve,
//                 innerRadius: '60%',
//                 explode: true,
//                 explodeIndex: showIndex,

//                 // gap: "3%",

//                 animationDuration: 0.0,
//               )
//             ],
//           ),
//         ),

//         for (var data in chartData) ...[
//           Container(
//             padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
//             height: showIndex == data.index ? 50 : 30,
//             // color:data.highlight?primary:secondaryLight,
//             decoration: BoxDecoration(
//               color: showIndex == data.index ? primary : secondaryLight,
//               borderRadius: BorderRadius.circular(7.5),
//             ),
//             // duration: const Duration(seconds: 10),
//             child: InkWell(
//               onTap: () {
//                 setState() {
//                   showIndex = data.index;
//                 }
//               },
//               child: Row(
//                 children: [
//                   Container(
//                     width: 60,
//                     height: 30,
//                     decoration: BoxDecoration(
//                       color: data.color,
//                       borderRadius: BorderRadius.circular(5),
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 20,
//                   ),
//                   Text(
//                     data.x,
//                     textScaleFactor: 1.2,
//                     style: TextStyle(
//                       color: data.highlight ? secondary : white,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 5,
//           )
//         ]

//         // Row(
//         //   children: [
//         //     Container(
//         //       width: 60,
//         //       height: 30,
//         //       decoration: BoxDecoration(
//         //         borderRadius: BorderRadius.circular(5),
//         //         color: const Color.fromARGB(255, 0, 18, 25),
//         //       ),
//         //     ),
//         //     const SizedBox(
//         //       width: 20,
//         //     ),
//         //     const Text(
//         //       "Food",
//         //       textScaleFactor: 1.2,
//         //       style: TextStyle(
//         //         color: white,
//         //       ),
//         //     ),
//         //   ],
//         // )
//       ],
//     ),
//   );
// }
