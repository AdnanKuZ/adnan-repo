import 'dart:convert';

import 'package:admin/constants.dart';
import 'package:admin/models/device.dart';
import 'package:admin/models/member.dart';
import 'package:admin/providers/add_device_provider.dart';
import 'package:admin/providers/contactUsProvider.dart';
import 'package:admin/server/requests.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

EditDeviceDialog({required BuildContext context,Color? color}) async {
  String _value = '';

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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      hintText: 'Rename Device',
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
                        Navigator.pop(context, _value);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Text(
                          'Finish',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}