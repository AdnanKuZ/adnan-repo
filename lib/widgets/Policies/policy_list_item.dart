import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PolicyWidget extends StatefulWidget {
  const PolicyWidget({ Key? key }) : super(key: key);

  @override
  _PolicyWidgetState createState() => _PolicyWidgetState();
}

class _PolicyWidgetState extends State<PolicyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Text("Test"),
    );
  }
}