import 'package:flutter/material.dart';

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

  CustomTextField(
      {required this.hintText,
      required this.keyboardType,
      required this.validator,
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
        ),
      ),
    ]);
  }
}
