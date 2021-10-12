import 'package:flutter/material.dart';

class AuthDialog extends StatelessWidget {
  const AuthDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        content: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          height: 350,
          width: 350,
          child: Container(),
        ),
      );
  }
}