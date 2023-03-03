import 'package:expense_tracker_flutter/screens/entry_screen.dart';
import 'package:expense_tracker_flutter/screens/home_screen.dart';
import 'package:expense_tracker_flutter/screens/signin_screen.dart';
import 'package:expense_tracker_flutter/screens/signup_screen.dart';
import 'package:expense_tracker_flutter/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: 'home_screen',
      routes: {

        'home_screen': (context) => const HomeScreen(),
        'signin_screen': (context) => const SignInScreen(),
        'signup_screen': (context) => const SignUpScreen(),
        'welcome_screen': (context) => const WelcomeScreen(),
        'entry_screen': (context) => const EntryScreen(),

      },
    );
  }
}




