import 'package:flutter/material.dart';
import 'package:trackspense/theme/colors.dart';

TextFormField textFieldUi(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextFormField(
    controller: controller,
    obscureText: isPasswordType,
    cursorColor: primary,
    style:const TextStyle(color: primary),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: primary,
      ),
      labelText: text,
      labelStyle:const TextStyle(color: primary),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: secondaryLight,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(width: 0, style: BorderStyle.none),
      ),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
    // hint
  );
}
