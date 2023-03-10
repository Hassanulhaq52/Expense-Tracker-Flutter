import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:expense_tracker_flutter/widgets/authentication_button.dart';
import 'package:expense_tracker_flutter/widgets/email_field.dart';
import 'package:expense_tracker_flutter/widgets/password_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? email;
  String? password;
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await Navigator.pushNamed(context, 'home_screen');
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up Screen'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    'assets/signup.png',
                    height: 150,
                    width: 150,
                    color: Colors.blueAccent,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  EmailField(onchanged: (value) {
                    email = value;
                  }),
                  const SizedBox(
                    height: 20,
                  ),
                  PasswordField(onchanged: (value) {
                    password = value;
                  }),
                  const SizedBox(
                    height: 20,
                  ),
                  AuthenticationButton(
                      colour: Colors.blueAccent,
                      onpressed: () async {
                        try {
                          final newUser =
                              await _auth.createUserWithEmailAndPassword(
                                  email: email!, password: password!);
                          if (newUser != null) {
                            Navigator.pushNamed(context, 'welcome_screen');
                          }
                          newUser;
                        } catch (e) {
                          print(e);
                        }
                      },
                      title: 'Register'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already a Member?',
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'signin_screen');
                        },
                        child: Text('Sign In'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
