import 'package:flutter/material.dart';

class ChartData {
  ChartData(this.index, this.x, this.y, this.color, this.highlight);
  var index;
  final String x;
  final double y;
  final Color color;
  final bool highlight;
}

final List<ChartData> chartData = [
  ChartData(
    0,
    'Food',
    0.000001,
    const Color.fromARGB(255, 249, 65, 68),
    true,
  ),
  ChartData(
    1,
    'Shopping',
    0.000001,
    const Color.fromARGB(255, 243, 114, 44),
    false,
  ),
  ChartData(
    2,
    'Medicines',
    0.000001,
    const Color.fromARGB(255, 248, 150, 30),
    false,
  ),
  ChartData(
    3,
    'Transport',
    0.000001,
    const Color.fromARGB(255, 249, 132, 74),
    false,
  ),
  ChartData(
    4,
    'Utilities',
    00.000001,
    const Color.fromARGB(255, 249, 199, 79),
    false,
  ),
  ChartData(
    5,
    'Education',
    00.000001,
    const Color.fromARGB(255, 144, 190, 109),
    false,
  ),
  ChartData(
    6,
    'Entertainment',
    00.000001,
    const Color.fromARGB(255, 67, 170, 139),
    false,
  ),
  ChartData(
    7,
    'Clothing',
    00.000001,
    const Color.fromARGB(255, 77, 144, 142),
    false,
  ),
  ChartData(
    8,
    'Rent',
    00.000001,
    const Color.fromARGB(255, 87, 117, 144),
    false,
  ),
  ChartData(
    9,
    'Others',
    00.000001,
    const Color.fromARGB(255, 39, 125, 161),
    false,
  ),
];
