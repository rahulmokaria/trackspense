import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trackspense/theme/colors.dart';
import 'package:trackspense/widgets/textFieldUi.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
      body: Stack(
        children: [
          Container(
              padding: const EdgeInsets.only(left: 35, top: 45),
              child: const Text(
                "Create\nAccount",
                style: TextStyle(color: primary, fontSize: 60),
              )),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  right: 35,
                  left: 35,
                  top: MediaQuery.of(context).size.height * 0.27),
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
                        // fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    onPressed: () {
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: _emailTextController.text,
                              password: _passwordTextController.text)
                          .then((value) {
                        Navigator.pushNamed(context, 'homePage');
                      }).onError((error, stackTrace) {
                        print("Error ${error.toString()}");
                      });
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
                          Navigator.pushNamed(context, 'login');
                        },
                        child: const Text(
                          'Already have an account...',
                          style: TextStyle(
                            // decoration: TextDecoration.underline,
                            fontSize: 18,
                            color: primary,
                          ),
                        )),
                  ],
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
