import 'package:flutter/material.dart';
import 'package:trackspense/theme/colors.dart';

class MyTheme {
  static ThemeData LightTheme(BuildContext context) => ThemeData(
      primarySwatch: colorCustom,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        iconTheme: const IconThemeData(color: secondary),
        textTheme: Theme.of(context).textTheme,
      )
      // primaryTextTheme: GoogleFonts.latoTextTheme()
      );
}
