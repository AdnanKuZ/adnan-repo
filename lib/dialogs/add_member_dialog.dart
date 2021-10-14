import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AddMemberDialog({required BuildContext context, Color? color}) async {
  String _value = '';
  GlobalKey<FormState> key = GlobalKey<FormState>();

  return showDialog<String>(
      context: context,
      builder: (context) {
        var primaryColor = color;
        return new AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          content: Container(
            width: 350,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: key,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      style: TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        hintText: 'New Member Name',
                        hintStyle: TextStyle(color: Colors.grey),
                        labelStyle: TextStyle(color: Colors.grey),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onFieldSubmitted: (value) {
                        if (value.isEmpty) {
                          return;
                        }
                        Navigator.pop(context, value);
                      },
                      onChanged: (value) {
                        _value = value;
                      },
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: primaryColor, // background
                        ),
                        onPressed: () {
                          key.currentState?.validate();
                          if (_value.isEmpty) {
                            return;
                          }
                          Navigator.pop(context, _value);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: const Text(
                            'Add Member',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: primaryColor, // background
                        ),
                        onPressed: () {
                          if (_value.isEmpty) {
                            return;
                          }
                          Navigator.pop(context, _value);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: const Text(
                            'Cancel',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      });
}
