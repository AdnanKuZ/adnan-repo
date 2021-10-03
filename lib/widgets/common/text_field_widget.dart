import 'package:flutter/material.dart';

typedef OnChanged = void Function(String);

class CustomTextField extends StatelessWidget {
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget? prefix;
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final bool state;
  final FormFieldValidator validator;
  final int? maxLines;
  final void Function(String)? submit;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final OnChanged? onChanged;

  CustomTextField(
      {required this.hintText,
      required this.keyboardType,
      required this.validator,
      this.onChanged,
      this.controller,
      this.suffixIcon,
      required this.state,
      this.maxLines,
      this.submit,
      this.focusNode,
      this.textInputAction,
      this.prefixIcon,
      this.prefix});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.blue.shade50.withOpacity(0.6),
            spreadRadius: 1,
            blurRadius: 8,
            offset: Offset(3, 3),
          )
        ]),
        child: TextFormField(
          focusNode: focusNode,
          controller: controller,
          obscureText: state,
          decoration: InputDecoration(
            alignLabelWithHint: true,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 45.5, vertical: 14),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            hintText: hintText,
            prefixStyle: TextStyle(textBaseline: TextBaseline.alphabetic),
            hintStyle: TextStyle(color: Colors.grey),
            suffixIcon: suffixIcon,
            errorMaxLines: 1,
            prefixIcon: prefixIcon,
            prefix: prefix,
          ),
          maxLines: maxLines,
          validator: validator,
          style: TextStyle(color: Colors.black, fontSize: 14),
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          onFieldSubmitted: submit,
        child: 
        TextFormField(
        onChanged: onChanged,
        controller: controller,
        obscureText: state,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(right: 14.5,left: 14.5, top: 10),
          filled: true,
          fillColor: Colors.white,
          
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          // enabledBorder: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          suffixIcon: suffixIcon,
          errorStyle: TextStyle(fontSize: 12, height: 0.2),

        ),
        validator: validator,
        style: TextStyle(color: Colors.black, fontSize: 14),
        keyboardType: keyboardType,
          ),
      );
  }
}
