import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SeperatorWidget extends StatelessWidget {
  const SeperatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
        child: Divider(
          height: 1,
          color: Color(0xFFF3F3F3),
        ));
  }
}