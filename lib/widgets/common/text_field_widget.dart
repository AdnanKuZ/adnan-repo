import 'package:flutter/material.dart';

typedef OnChanged = void Function(String);

class CustomTextField extends StatelessWidget {
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget? prefix;
  final String? hintText;
  final Widget? suffix;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final bool? state;
  final FormFieldValidator? validator;
  final int? maxLines;
  final void Function(String)? submit;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final OnChanged? onChanged;
  final double? leftPadding;
  final double? topPadding;
  final String? labelText;

  CustomTextField(
      {this.hintText,
      this.suffix,
      required this.keyboardType,
      this.validator,
      this.onChanged,
      this.labelText,
      this.controller,
      this.suffixIcon,
      this.state,
      this.maxLines,
      this.submit,
      this.focusNode,
      this.textInputAction,
      this.prefixIcon,
      this.prefix,
      this.leftPadding,
      this.topPadding});

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 350,
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
        onChanged: onChanged,
        controller: controller,
        obscureText: state ?? false,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.only(
            right: 14.5,
            left: leftPadding ?? 14.5,
            top: topPadding ?? 14,
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.blue),
                  borderRadius: BorderRadius.circular(6),
                ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          labelText: labelText,
          suffix: suffix,
          suffixIcon: suffixIcon,
          errorStyle: TextStyle(fontSize: 12, height: 0.2),
          prefixIcon: prefixIcon,
          prefix: prefix,
        ),
        maxLines: maxLines,
        validator: validator,
        style: TextStyle(color: Colors.black, fontSize: 14),
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        onFieldSubmitted: submit,
      ),
    );
  }
}
