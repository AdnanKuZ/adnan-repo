import 'package:admin/constants.dart';
import 'package:admin/providers/policies_list_provider.dart';
import 'package:admin/screens/dashboard/dashboard.dart';
import 'package:admin/widgets/common/elevated_button_widget.dart';
import 'package:flutter/material.dart';

typedef OnDelete = Function();

class DeleteDialog extends StatelessWidget {
  final String title;
  final OnDelete onDel;
  DeleteDialog({Key? key, required this.title, required this.onDel})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      content: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
        height: 200,
        width: 200,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  title,
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
              ),
              Spacer(),
              Container(
                  width: 150,
                  height: 40,
                  child: CustomElevatedButton(
                    buttonColor: primaryColor,
                    splashColor: Colors.white,
                    textColor: Colors.white,
                    onpressed: () {
                      onDel();
                      Navigator.pop(context);
                    },
                    title: "Delete",
                  )),
              SizedBox(
                height: 12,
              ),
              Container(
                  width: 150,
                  height: 40,
                  child: CustomElevatedButton(
                    buttonColor: Colors.white,
                    splashColor: Colors.white,
                    textColor: primaryColor,
                    onpressed: () {
                      Navigator.pop(context);
                    },
                    title: "Cancel",
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
