import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;

  CustomTextField({
    required this.hintText,
    required this.keyboardType
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.6),
          spreadRadius: 3,
          blurRadius: 5,
          offset: Offset(3,3),
        )
      ]),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 14.5, vertical: 8),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            // borderSide: BorderSide(color: Colors.grey)
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey)
        ),
        style: TextStyle(color: Colors.black, fontSize: 14),
        keyboardType: keyboardType,
      ),
    );
  }
}
