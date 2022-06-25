import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:trackspense/data/data_functions.dart';
import 'package:trackspense/theme/my_theme.dart';

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
          (totalExpense == 0)
              ? Column(
                  children: const [
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "No expense made",
                      textScaleFactor: 1.1,
                      style: TextStyle(color: black),
                    ),
                  ],
                )
              : Center(
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
          if (totalExpense != 0)
            for (var data in chartData) ...[
              if (data.y != 0)
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      height: showIndex == data.index ? 50 : 30,
                      // color:data.highlight?primary:secondaryLight,
                      decoration: BoxDecoration(
                        color:
                            showIndex == data.index ? primary : secondaryLight,
                        borderRadius: BorderRadius.circular(7.5),
                      ),
                      // duration: const Duration(seconds: 10),
                      child: InkWell(
                        onTap: () {
                          // changeChartIndex(data.index);
                          setState(() {
                            showIndex = data.index;
                          });
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
                                color:
                                    showIndex == data.index ? secondary : white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                )
            ]
        ],
      ),
    );
  }
}
