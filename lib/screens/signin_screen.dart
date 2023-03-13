import 'package:expense_tracker_flutter/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:expense_tracker_flutter/widgets/email_field.dart';
import 'package:expense_tracker_flutter/widgets/password_field.dart';
import 'package:expense_tracker_flutter/widgets/authentication_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String? email;
  String? password;
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ));
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sign In Screen'),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    'assets/signin.png',
                    height: 150,
                    width: 150,
                    color: Colors.lightBlueAccent,
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
                      colour: Colors.lightBlueAccent,
                      onpressed: () async {
                        try {
                          final user = await _auth.signInWithEmailAndPassword(email: email!, password: password!);
                          if (user != null) {
                            Navigator.pushNamed(context, 'welcome_screen');
                          }
                        } catch (e) {
                          print(e);
                        }
                      },
                      title: 'Sign In'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Dont you have an Account?',
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'signup_screen');
                        },
                        child: const Text('Sign Up'),
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
