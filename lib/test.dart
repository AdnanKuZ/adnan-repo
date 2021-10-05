import 'package:flutter/material.dart';
import 'package:auto_size_text_pk/auto_size_text_pk.dart';

class TestWidget extends StatelessWidget {
  const TestWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        child: AutoSizeText(
          'Let\'s select members and devices for this policy',
          maxLines: 1,
          maxFontSize: 22,
          minFontSize: 13,
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
      )),
    );
  }
}
