import 'package:admin/constants.dart';
import 'package:flutter/material.dart';

class BandwidthRowWidget extends StatelessWidget {
  final bool allDays;
  final String title;
  const BandwidthRowWidget(
      {Key? key, required this.allDays, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _chosenValue = "Full Bandwidth";
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            allDays
                ? InkWell(
                    onTap: () {},
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: primaryColor,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Container(
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: primaryColor,
                            border: Border.all(
                              color: primaryColor,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(3))),
                      ),
                    ),
                  )
                : SizedBox.shrink(),
            Text(
              '   $title',
              style: TextStyle(color: Colors.grey, fontSize: 18),
            )
          ],
        ),
        DropdownButton<String>(
          focusColor: Colors.white,
          value: _chosenValue,
          elevation: 5,
          style: TextStyle(color: Colors.white),
          iconEnabledColor: Colors.black,
          items: <String>[
            'Full Bandwidth',
            'Medium Bandwidth',
            'Small Bandwidth',
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
          // onChanged: (String value) {
          //   print("object");
          // },
        ),
      ],
    ));
  }
}
