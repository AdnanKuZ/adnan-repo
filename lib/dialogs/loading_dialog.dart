
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

LoadingDialog({required BuildContext context}) async {
  void dismiss() {
    Navigator.pop(context);
  }
  
  return showDialog<String>(
    barrierDismissible: false,
      context: context,
      builder: (context) {
        return Container(
          width: 350,
          height: 350,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(
                height: 10,
              ),
              Text(
                "Loading...",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        );
      });
}
