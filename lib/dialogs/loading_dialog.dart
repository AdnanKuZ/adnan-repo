import 'package:admin/constants.dart';
import 'package:admin/providers/contactUsProvider.dart';
import 'package:admin/server/requests.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

LoadingDialog({required BuildContext context}) async {
  void dismiss() {
    Navigator.pop(context);
  }
  
  return showDialog<String>(
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
