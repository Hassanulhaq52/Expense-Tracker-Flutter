import 'package:expense_tracker_flutter/constants/constants.dart';
import 'package:expense_tracker_flutter/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EmailField extends StatelessWidget {
  const EmailField({Key? key, required this.onchanged}) : super(key: key);

  final Function(String) onchanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardAppearance: Brightness.dark,
      keyboardType: TextInputType.emailAddress,
      onChanged: onchanged,
      decoration: Constants.fieldDecoration.copyWith(
        hintText: 'Enter Your Email',
        prefixIcon: Icon(Icons.email_outlined),
      ),
    );
  }
}