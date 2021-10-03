import 'package:flutter/material.dart';

class TopEdgesContainer extends StatelessWidget {
  final Widget? child;
  final double? topPadding;
  final Color? color;
  const TopEdgesContainer({this.child, this.topPadding, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.only(top: topPadding ?? 0.0),
      child: Container(
        decoration: BoxDecoration(
          color: color ?? Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: child,
      ),
    );
  }
}
