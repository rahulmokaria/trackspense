import 'package:flutter/material.dart';
import 'package:trackspense/theme/colors.dart';

class CreateNewIncome extends StatefulWidget {
  const CreateNewIncome({Key? key}) : super(key: key);

  @override
  State<CreateNewIncome> createState() => _CreateNewIncomeState();
}

class _CreateNewIncomeState extends State<CreateNewIncome> {
  num amount = 0;
  String cat = '';
  String remark = "";
  DateTime date = DateTime.now();

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      backgroundColor: secondary,
      appBar: AppBar(
        // elevation: 0.0,
        title: const Text('New Income'),
        backgroundColor: primary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(30.0),
        children: [
          TextFormField(
            onChanged: (value) {
              setState(() {
                amount = int.parse(value);
              });
            },
            cursorColor: white,
            style: const TextStyle(color: white),
            decoration: InputDecoration(
              hintText: "Enter Amount",
              hintStyle: const TextStyle(color: white),
              labelText: "Amount:",
              labelStyle: const TextStyle(color: white),

              filled: true,
              // floatingLabelBehavior: FloatingLabelBehavior.never,
              fillColor: secondaryLight,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 0, style: BorderStyle.none),
              ),
            ),
            // hint
          ),

          // TextFormField(
          //   onChanged: (value) {
          //     setState(() {
          //       amount = value as num;
          //     });
          //   },
          //   decoration: const InputDecoration(
          //     hintText: "Enter Amount",
          //     labelText: "Username",
          //   ),
          //   validator: (value) {
          //     if (value!.isEmpty) {
          //       return "Username cannot be empty";
          //     }
          //     return null;
          //   },
          // ),

          const SizedBox(
            height: 30,
          ),
          TextFormField(
            cursorColor: white,
            style: const TextStyle(color: white),
            decoration: InputDecoration(
              hintText: "Add Remark",
              hintStyle: const TextStyle(color: white),
              labelText: "Remark:",
              labelStyle: const TextStyle(color: white),

              filled: true,
              // floatingLabelBehavior: FloatingLabelBehavior.never,
              fillColor: secondaryLight,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 0, style: BorderStyle.none),
              ),
            ),
            // hint
          ),
          const SizedBox(
            height: 30,
          ),
          TextFormField(
            cursorColor: white,
            style: const TextStyle(color: white),
            decoration: InputDecoration(
              hintText: "Select Date",
              hintStyle: const TextStyle(color: white),
              labelText: "Date:",
              labelStyle: const TextStyle(color: white),

              filled: true,
              // floatingLabelBehavior: FloatingLabelBehavior.never,
              fillColor: secondaryLight,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 0, style: BorderStyle.none),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),

          Container(
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
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'homePage');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text(
                    "Add",
                    textScaleFactor: 1.4,
                    style: TextStyle(color: white),
                  ),
                ],
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
