import 'package:flutter/material.dart';

const Color primary = Color.fromARGB(255, 33, 205, 154);
const Color primaryContrast = Color.fromARGB(255, 242, 126, 118);
const Color secondary = Color.fromARGB(255, 26, 43, 52);
const Color secondaryLight = Color.fromARGB(255, 23, 59, 78);
const Color black = Color(0xFF000000);
const Color white = Color(0xFFFFFFFF);
const Color grey = Colors.grey;
const Color red = Color(0xFFec5766);
const Color green = Color(0xFF43aa8b);
const Color blue = Color(0xFF28c2ff);

Map<int, Color> color = {
  50: const Color.fromRGBO(33, 205, 154, .1),
  100: const Color.fromRGBO(33, 205, 154, .2),
  200: const Color.fromRGBO(33, 205, 154, .3),
  300: const Color.fromRGBO(33, 205, 154, .4),
  400: const Color.fromRGBO(33, 205, 154, .5),
  500: const Color.fromRGBO(33, 205, 154, .6),
  600: const Color.fromRGBO(33, 205, 154, .7),
  700: const Color.fromRGBO(33, 205, 154, .8),
  800: const Color.fromRGBO(33, 205, 154, .9),
  900: const Color.fromRGBO(33, 205, 154, 1),
};

MaterialColor colorCustom = MaterialColor(0xFF21CD9A, color);
