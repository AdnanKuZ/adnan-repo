import 'package:admin/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StepperCheckbox extends StatelessWidget {
  bool isChecked = false;
  Color? color;
  Function onChecked;

  StepperCheckbox({required this.isChecked, required this.onChecked ,Key? key}) {
    this.color = isChecked ? primaryColor : lightGrayColor;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onChecked(!isChecked),
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
            border: Border.all(
              color: color!,
            ),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: color!,
              border: Border.all(
                color: color!,
              ),
              borderRadius: BorderRadius.all(Radius.circular(3))),
        ),
      ),
    );
  }
}
