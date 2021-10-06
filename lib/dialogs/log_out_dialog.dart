import 'package:flutter/material.dart';

Future<bool?> showLogoutDialog(context) async {
  return showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
            content:Padding(
              padding: const EdgeInsets.symmetric(vertical:12.0,horizontal: 8),
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                Text('Logout?',style: TextStyle(fontWeight: FontWeight.bold),),
                Text('Are you sure you want to logout from this user now?',style: TextStyle(fontWeight: FontWeight.bold),),
              ],),
            ),
            actions: [
              
            ],
      );
    },
  );
}
