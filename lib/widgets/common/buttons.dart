import 'package:admin/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../responsive.dart';

class FilledButton extends StatelessWidget {
  String title;
  Function onPress;

  FilledButton({required this.title, required this.onPress, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: primaryColor,
        padding: EdgeInsets.symmetric(
          horizontal: defaultPadding,
          vertical: defaultPadding / (Responsive.isMobile(context) ? 1 : 1),
        ),
      ),
      onPressed: () => onPress(),
      icon: Icon(Icons.add),
      label: Text(title),
    );
  }
}

class BorderButton extends StatelessWidget {
  String title;
  Function onPress;

  BorderButton({required this.title, required this.onPress, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: lightGrayColor, width: 1)),
        backgroundColor: Colors.white,
        padding: EdgeInsets.symmetric(
          horizontal: defaultPadding,
          vertical: defaultPadding / (Responsive.isMobile(context) ? 1 : 1),
        ),
      ),
      onPressed: () => onPress(),
      icon: Icon(
        Icons.add,
        color: Colors.black,
      ),
      label: Text(
        title,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}

class RoundedAddButton extends StatelessWidget {
  Function onClick;
  Color borderColor;
  Color iconColor;
  RoundedAddButton({
    required this.onClick,
    required this.borderColor,
    required this.iconColor,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick();
      },
      child: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
            border: Border.all(
              color: borderColor,
              width: 1.5
            ),
            borderRadius: BorderRadius.all(Radius.circular(6))),
        child: Icon(
          Icons.add,
          color: iconColor,
        ),
      ),
    );
  }
}
