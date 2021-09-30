import 'package:flutter/material.dart';
import 'package:admin/constants.dart';

class CustomElevatedButton extends StatelessWidget {
  final Color buttonColor;
  final Color splashColor;
  final Color textColor;
  final Color iconColor;
  final String title;
  final IconData? icon;

  CustomElevatedButton(
      {required this.buttonColor,
      required this.splashColor,
      required this.textColor,
      required this.iconColor,
      required this.title,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      
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
            Icon(icon,color: iconColor,size: 20,),
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
