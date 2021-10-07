import 'package:flutter/material.dart';

class TopEdgesContainer extends StatelessWidget {
  final Widget? child;
  final double? topPadding;
  final Color? color;
  final bool isBottomEdges;
  const TopEdgesContainer({this.child, this.topPadding, this.color,this.isBottomEdges=false});

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
            bottomRight:isBottomEdges? Radius.circular(20):Radius.zero,
            bottomLeft: isBottomEdges? Radius.circular(20):Radius.zero,
          ),
        ),
        child: child,
      ),
    );
  }
}
