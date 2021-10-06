import 'package:flutter/material.dart';
import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Test extends StatefulWidget {
  Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  String? _chosenValue = "Full";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey.withOpacity(0.5),
        child: DropdownButtonHideUnderline(
          child: DropdownButtonFormField<String>(
            icon: Icon(Icons.arrow_drop_down,color: Colors.black,),
            
            focusColor: Colors.white,
            value: _chosenValue,
            elevation: 5,
            style: TextStyle(color: Colors.white),
            iconEnabledColor: Colors.black,
            items: <String>[
              'Full',
              'Medium',
              'Small',
              'Block'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(color: Colors.black),
                ),
              );
            }).toList(),
            hint: Text(
              "Please choose a langauage",
              style: TextStyle(
                  color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
            ),
            onChanged: (String? value) {
              setState(() {
                _chosenValue = value;
              });
            },
          ),
        )
      ),
    );
  }
}
