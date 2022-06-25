import 'package:flutter/material.dart';

import 'package:trackspense/data/data_functions.dart';
import 'package:trackspense/theme/my_theme.dart';
import 'package:trackspense/widgets/text_field_ui.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _userNameTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondary,
        elevation: 0,
      ),
      backgroundColor: secondary,
      body: ListView(
        children: [
          Container(
              padding: const EdgeInsets.only(left: 35, top: 45),
              child: const Text(
                "Create\nAccount",
                style: TextStyle(color: primary, fontSize: 60),
              )),
          const SizedBox(
            height: 75,
          ),
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(
                right: 35,
                left: 35,
              ),
              child: Column(children: [
                textFieldUi('Name', Icons.person_outline, false,
                    _userNameTextController),
                const SizedBox(
                  height: 30,
                ),
                textFieldUi(
                    'Email', Icons.email_outlined, false, _emailTextController),
                const SizedBox(
                  height: 30,
                ),
                textFieldUi('Password', Icons.lock_outline, true,
                    _passwordTextController),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(
                    child: const Text(
                      "Register",
                      style: TextStyle(
                        color: secondary,
                        fontSize: 16,
                      ),
                    ),
                    onPressed: () {
                      registerNewUserDb(
                        context,
                        _emailTextController,
                        _passwordTextController,
                        _userNameTextController,
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.pressed)) {
                          return secondary;
                        }
                        return primary;
                      }),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'loginPage');
                        },
                        child: const Text(
                          'Already have an account...',
                          style: TextStyle(
                            fontSize: 18,
                            color: primary,
                          ),
                        )),
                  ],
                ),
              ]),
            ),
          ),
          const SizedBox(
            height: 75,
          ),
        ],
      ),
    );
  }
}
