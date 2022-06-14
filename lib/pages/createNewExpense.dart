// import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

import 'package:trackspense/theme/colors.dart';
import 'package:trackspense/utils/chartData.dart';

class CreateNewExpense extends StatefulWidget {
  const CreateNewExpense({Key? key}) : super(key: key);

  @override
  State<CreateNewExpense> createState() => _CreateNewExpenseState();
}

class _CreateNewExpenseState extends State<CreateNewExpense> {
  double amount = 0;
  String cat = "";
  String remark = "";
  DateTime date = DateTime.now();

  var dropdownValue = 'Food';
  var categories = [
    for (var data in chartData) ...[
      data.x,
    ]
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
        // elevation: 0.0,
        title: const Text(
          'New Expense',
        ),
        backgroundColor: primary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(30.0),
        children: [
          TextFormField(
            onChanged: (value) {
              setState(() {
                amount = (value) as double;
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
          Container(
            decoration: BoxDecoration(
              color: secondaryLight,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
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
                  width: 50,
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
          // DropdownButton<String>(
          //   value: dropdownValue,
          //   icon: const Icon(Icons.arrow_downward),
          //   elevation: 16,
          //   style: const TextStyle(color: Colors.deepPurple),
          //   underline: Container(
          //     height: 2,
          //     color: Colors.deepPurpleAccent,
          //   ),
          //   onChanged: (String? newValue) {
          //     setState(() {
          //       dropdownValue = newValue!;
          //     });
          //   },
          //   items: <String>['One', 'Two', 'Free', 'Four']
          //       .map<DropdownMenuItem<String>>((String value) {
          //     return DropdownMenuItem<String>(
          //       value: value,
          //       child: Text(value),
          //     );
          //   }).toList(),
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
          // TextFormField(
          //   cursorColor: white,
          //   style: const TextStyle(color: white),
          //   decoration: InputDecoration(
          //     hintText: "Select Date",
          //     hintStyle: const TextStyle(color: white),
          //     labelText: "Date:",
          //     labelStyle: const TextStyle(color: white),

          //     filled: true,
          //     // floatingLabelBehavior: FloatingLabelBehavior.never,
          //     fillColor: secondaryLight,
          //     border: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(10),
          //       borderSide: const BorderSide(width: 0, style: BorderStyle.none),
          //     ),
          //   ),
          // ),

          Container(
            decoration: BoxDecoration(
              color: secondaryLight,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: InkWell(
              onTap: () => _selectDate(context),
              child: Text("select it"),
            ),
            // child: DateTimePicker(
            //   type: DateTimePickerType.date,
            //   initialDate: DateTime.now(),
            //   firstDate: DateTime(2000),
            //   lastDate: DateTime(2100),
            //   icon: const Icon(
            //     Icons.event,
            //     color: white,
            //   ),
            //   dateLabelText: 'Date:',
            //   dateHintText: 'Select Date',
            //   fieldHintText: 'Rahul',
            //   // calendarTitle: ,
            //   timeLabelText: "Hour",
            //   cursorColor: white,
            //   style: const TextStyle(
            //     color: white,
            //     // backgroundColor: secondary,
            //   ),
            //   onChanged: (val) => print(val),
            //   validator: (val) {
            //     print(val);
            //     return null;
            //   },
            //   onSaved: (val) => print(val),
            // ),
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
