import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final Widget? suffixIcon;
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final bool state;
  final FormFieldValidator validator;

  CustomTextField(
      {required this.hintText,
      required this.keyboardType,
      required this.validator,
      this.controller,
      this.suffixIcon,
      required this.state});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.blue.shade50.withOpacity(0.6),
            spreadRadius: 1,
            blurRadius: 8,
            offset: Offset(3, 3),
          )
        ]),
        child: TextFormField(
          controller: controller,
          obscureText: state,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 14.5, vertical: 4),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey),
            suffixIcon: suffixIcon,
            errorMaxLines: 1,
          ),
          validator: validator,
          style: TextStyle(color: Colors.black, fontSize: 14),
          keyboardType: keyboardType,
        ),
      ),
    ]);
  }
}
