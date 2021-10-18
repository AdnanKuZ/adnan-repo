import 'package:flutter/material.dart';
import 'package:admin/constants.dart';

typedef OnPressed = void Function();

class CustomElevatedButton extends StatelessWidget {
  final Color buttonColor;
  final Color? splashColor;
  final Color? textColor;
  final Color? iconColor;
  final String? title;
  final IconData? icon;
  final OnPressed? onpressed;

  const CustomElevatedButton(
      {Key? key,
      required this.buttonColor,
      this.splashColor,
      this.textColor,
      this.iconColor,
      this.title,
      this.icon,
      this.onpressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed == null ? () {} : onpressed!,
      child: Text(
        title == null ? 'Button' : title!,
        style: TextStyle(color: textColor, fontSize: 18),
      ),
      // style: ElevatedButton.styleFrom(
      //     primary: buttonColor,
      //     fixedSize: Size(50, 54),
      //     side: BorderSide(
      //       color: primaryColor,
      //       width: 1,
      //     ),
      //     shape:
      //         RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
      //     onPrimary: splashColor),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        side: BorderSide(
            color: primaryColor,
            width: 1,
          ),
        primary: buttonColor,
        padding: EdgeInsets.symmetric(
          horizontal: defaultPadding,
          vertical: defaultPadding,
        ),
        onPrimary: splashColor
      ),
    );
  }
}
