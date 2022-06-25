import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:trackspense/data/data_functions.dart';
import 'package:trackspense/data/data_values.dart';
import 'package:trackspense/theme/my_theme.dart';
import 'package:trackspense/widgets/show_error.dart';

class CreateNewIncome extends StatefulWidget {
  const CreateNewIncome({Key? key}) : super(key: key);

  @override
  State<CreateNewIncome> createState() => _CreateNewIncomeState();
}

class _CreateNewIncomeState extends State<CreateNewIncome> {
  final TextEditingController _amountTextController = TextEditingController();
  final TextEditingController _remarkTextController = TextEditingController();
  double? amount = 0;
  String? cat = '';
  DateTime date = DateTime.now();
  double? balance = netBalance;

  var dropdownValue = 'Salary';
  var categories = [
    'Salary',
    'Investment income',
    'Gift',
    'Loan',
    'Commission',
    'Retire pensions',
    'Other Incomes',
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (picked != null && picked != date) {
      setState(() {
        date = picked;
        print(date);
      });
    }
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      backgroundColor: secondary,
      appBar: AppBar(
        title: const Text('New Income'),
        backgroundColor: primary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(30.0),
        children: [
          TextFormField(
            controller: _amountTextController,
            cursorColor: white,
            style: const TextStyle(color: white),
            decoration: InputDecoration(
              hintText: "Enter Amount",
              hintStyle: const TextStyle(color: white),
              labelText: "Amount:",
              labelStyle: const TextStyle(color: white),
              filled: true,
              fillColor: secondaryLight,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 0, style: BorderStyle.none),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "Amount cannot be empty";
              } else {
                return null;
              }
            },
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
              color: secondaryLight,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
            child: Row(
              children: [
                const Text(
                  "Category:",
                  style: TextStyle(
                    color: white,
                  ),
                  textScaleFactor: 1.2,
                ),
                const SizedBox(
                  width: 30,
                ),
                DropdownButton(
                  value: dropdownValue,
                  underline: const SizedBox(),
                  dropdownColor: secondaryLight,
                  items:
                      categories.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      child: Text(
                        value,
                        textScaleFactor: 1.2,
                      ),
                      value: value,
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                      cat = dropdownValue;
                    });
                  },
                  icon: const Icon(Icons.keyboard_arrow_down),
                  style: const TextStyle(
                    color: white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          TextFormField(
            controller: _remarkTextController,
            cursorColor: white,
            style: const TextStyle(color: white),
            decoration: InputDecoration(
              hintText: "Add Remark",
              hintStyle: const TextStyle(color: white),
              labelText: "Remark:",
              labelStyle: const TextStyle(color: white),
              filled: true,
              fillColor: secondaryLight,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 0, style: BorderStyle.none),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "Remark cannot be empty";
              } else {
                return null;
              }
            },
            // hint
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
              color: secondaryLight,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.fromLTRB(15, 20, 0, 20),
            child: InkWell(
              onTap: () => _selectDate(context),
              child: Row(
                children: [
                  const Text(
                    "Select Date:",
                    style: TextStyle(
                      color: white,
                    ),
                    textScaleFactor: 1.2,
                  ),
                  const SizedBox(
                    width: 20,
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
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Divider(
            color: white,
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 50,
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
            child: ElevatedButton(
              child: const Text(
                "Add",
                textScaleFactor: 1.4,
                style: TextStyle(
                  color: white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                newIncomeDb(
                  double.parse(_amountTextController.text),
                  _remarkTextController.text,
                  cat!,
                  date,
                  balance! + double.parse(_amountTextController.text),
                )
                    .then(Navigator.pushNamed(context, 'homePage'))
                    .onError((error, stackTrace) {
                  ScaffoldMessenger.of(context).showSnackBar(showError(
                      "Oh Snap!",
                      error.toString(),
                      primaryContrast,
                      CupertinoIcons.exclamationmark_circle));
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  return secondaryLight;
                }),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
