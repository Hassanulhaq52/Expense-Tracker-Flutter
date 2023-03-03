import 'package:expense_tracker_flutter/constants/constants.dart';
import 'package:flutter/material.dart';


class PasswordField extends StatelessWidget {
  const PasswordField({Key? key, required this.onchanged}) : super(key: key);

  final Function(String) onchanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardAppearance: Brightness.dark,
      obscureText: true,
      onChanged: onchanged,
      decoration: Constants.fieldDecoration.copyWith(
        hintText: 'Enter Your Password',
        prefixIcon: Icon(Icons.lock),
      ),
    );
  }
}