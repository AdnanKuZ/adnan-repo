import 'package:admin/widgets/common/buttons.dart';
import 'package:flutter/material.dart';

class AuthDialog extends StatelessWidget {

  String title;
  AuthDialog({Key? key,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      content: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
        height: 130,
        width: 250,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14
                  ),
                ),
              ),
              Spacer(),
              Container(
                width: 120,
                height: 40,
                child: FilledButton(
                  onPress: () {
                    Navigator.pop(context);
                  },
                  title: "OK",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
