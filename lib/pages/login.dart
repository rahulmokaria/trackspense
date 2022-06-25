import 'package:flutter/material.dart';

import 'package:trackspense/data/data_functions.dart';
import 'package:trackspense/theme/my_theme.dart';
import 'package:trackspense/widgets/text_field_ui.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 35, top: 80),
            child: const Text(
              "Welcome\nback",
              style: TextStyle(
                color: primary,
                fontSize: 60,
              ),
            ),
          ),
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
                textFieldUi('Email', Icons.person, false, _emailTextController),
                const SizedBox(
                  height: 30,
                ),
                textFieldUi('Password', Icons.lock_outline, true,
                    _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'forgotPasswordPage');
                        },
                        child: const Text(
                          'Forgot Password',
                          style: TextStyle(
                            fontSize: 18,
                            color: primary,
                          ),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(90)),
                  child: ElevatedButton(
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: secondary,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    onPressed: () {
                      loginUserDb(context, _emailTextController,
                          _passwordTextController);
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
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'registerPage');
                        },
                        child: const Text(
                          "Don't have an account? Sign Up",
                          style: TextStyle(
                            fontSize: 18,
                            color: primaryContrast,
                          ),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
