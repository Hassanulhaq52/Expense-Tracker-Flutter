import 'package:flutter/material.dart';

class AuthenticationButton extends StatelessWidget {
  AuthenticationButton({
    required this.colour,
    required this.onpressed,
    required this.title,
  });

  final Color colour;
  final VoidCallback onpressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      color: colour,
      borderRadius: BorderRadius.circular(30.0),
      child: MaterialButton(
        onPressed: onpressed,
        minWidth: 200.0,
        height: 42.0,
        child: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}