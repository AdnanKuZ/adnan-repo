import 'package:flutter/material.dart';
import 'package:admin/constants.dart';

typedef OnPressed = void Function();

class CustomElevatedButton extends StatelessWidget {
  final Color buttonColor;
  final Color splashColor;
  final Color textColor;
  final Color iconColor;
  final String title;
  final IconData icon;
  final OnPressed? onpressed;

  CustomElevatedButton(
      {required this.buttonColor,
      required this.splashColor,
      required this.textColor,
      required this.iconColor,
      required this.title,
      required this.icon,
      this.onpressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Spacer(),
            Text(
              title,
              style: TextStyle(color: textColor),
            ),
            Spacer(),
            Icon(
              icon,
              color: iconColor,
              size: 20,
            ),
          ],
        ),
      ),
      style: ElevatedButton.styleFrom(
          primary: buttonColor,
          fixedSize: Size(50, 45),
          side: BorderSide(
            color: primaryColor,
            width: 1,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          onPrimary: splashColor),
    );
  }
}
