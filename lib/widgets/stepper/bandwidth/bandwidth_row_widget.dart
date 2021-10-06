import 'package:admin/constants.dart';
import 'package:admin/providers/dropDownProvider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
// import 'package:enhanced_drop_down/enhanced_drop_down.dart';

class BandwidthRowWidget extends StatelessWidget {
  final bool allDays;
  final String day;
  final String title;
  const BandwidthRowWidget(
      {Key? key, required this.allDays, required this.title, required this.day})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _dropdownprovider =
        Provider.of<DropDownProvider>(context, listen: false);
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.08),
          child: Container(
            width: 110,
            child: Row(
              children: [
                allDays
                    ? InkWell(
                        onTap: () {},
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Container(
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3))),
                          ),
                        ),
                      )
                    : SizedBox.shrink(),
                Text(
                  '   $title',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                )
              ],
            ),
          ),
        ),
        // SizedBox(width: 40,),
        Padding(
          padding:
              EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.08),
          child: Container(
            width: 160,
            // color: Colors.amber,
            child: Consumer<DropDownProvider>(
              builder: (context, instance, child) =>
                  DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                  color: Colors.black,
                  ),
                  isExpanded: false,
                  focusColor: Colors.white,
                  value: instance.dropDownValue[day],
                  elevation: 10,
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
                    "",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  onChanged: (String? value) {
                    _dropdownprovider.setDropDownValue(value!, day);
                  },
                ),
              ),
            ),
          ),
        ),
        // SizedBox(width: 40,),
        Padding(
          padding:
              EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.08),
          child: Container(
            width: 100,
            // color: Colors.amber,
            child: InkWell(
              child: Row(
                children: [
                  Text(
                    'Time From',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Icon(
                    FontAwesomeIcons.sort,
                    color: Colors.black87,
                    size: 14,
                  )
                ],
              ),
              onTap: () {
                showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                  // builder:
                );
              },
            ),
          ),
        ),
        // SizedBox(width: 80,),
        Container(
          width: 100,
          // color: Colors.amber,
          child: InkWell(
            child: Row(
              children: [
                Text(
                  'Time To',
                  style: TextStyle(color: Colors.grey),
                ),
                Icon(
                  FontAwesomeIcons.sort,
                    color: Colors.black87,
                    size: 14,
                )
              ],
            ),
            onTap: () {
              showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
                // builder:
              );
            },
          ),
        ),
      ],
    ));
  }
}
