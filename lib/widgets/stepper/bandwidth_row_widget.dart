import 'package:admin/constants.dart';
import 'package:admin/providers/bandwidthProvider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:admin/widgets/common/checkboxs.dart';

class BandwidthRowWidget extends StatelessWidget {
  final bool allDays;
  final String day;
  final String title;
  final BoxConstraints? constraints;
  const BandwidthRowWidget(
      {Key? key, required this.allDays, required this.title, required this.day,this.constraints})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<BandwidthProvider>(context);
    return Container(
        child:constraints!.maxWidth > 685 ? Row(
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
                        onTap: () {
                          // _provider.bandwidthSetTimeFrom(null, day);
                          // _provider.bandwidthSetTimeTo(null, day);
                          _provider.bandwidthSetIsChecked =
                              !_provider.bandwidthischecked;
                        },
                        child: Consumer<BandwidthProvider>(
                          builder: (context, instance, child) => Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: instance.bandwidthischecked
                                      ? primaryColor
                                      : Colors.grey,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: Container(
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: instance.bandwidthischecked
                                      ? primaryColor
                                      : Colors.grey,
                                  border: Border.all(
                                    color: instance.bandwidthischecked
                                        ? primaryColor
                                        : Colors.grey,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(3))),
                            ),
                          ),
                        ),
                      )
                    : SizedBox.shrink(),
                Text(
                  '   $title',
                  style: TextStyle(
                      color: allDays
                          ? _provider.bandwidthischecked
                              ? Colors.black
                              : Colors.grey
                          : _provider.bandwidthIsChecked
                              ? Colors.grey
                              : Colors.black,
                      fontSize: 16),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.08),
          child: Container(
            width: 160,
            child: Consumer<BandwidthProvider>(
              builder: (context, instance, child) =>
                  DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                    dropdownColor: Color(0xFFF8F8F8),
                    
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                    ),
                    isExpanded: false,
                    focusColor: Colors.white,
                    value: instance.bandwidthDropDownValue[day] == null ? "None" : instance.bandwidthDropDownValue[day],
                    elevation: 10,
                    style: TextStyle(color: Colors.white),
                    iconEnabledColor: Colors.black,
                    items: <String>[
                      'None',
                      'Full Bandwidth',
                      'Medium Bandwidth',
                      'Small Bandwidth',
                      'Block'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            color: allDays
                                ? _provider.bandwidthischecked
                                    ? Colors.black
                                    : Colors.grey
                                : _provider.bandwidthIsChecked
                                    ? Colors.grey
                                    : Colors.black,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: allDays
                        ? _provider.bandwidthischecked
                            ? (String? value) {
                                _provider.setBandwidthDropDownValue(
                                    value!, day);
                              }
                            : null
                        : _provider.bandwidthischecked
                            ? null
                            : (String? value) {
                                _provider.setBandwidthDropDownValue(
                                    value!, day);
                              }),
              ),
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.08),
          child: Container(
            width: 100,
            child: InkWell(
              child: Row(
                children: [
                  Consumer<BandwidthProvider>(
                    builder: (context, instance, child) => Text(
                      instance.getbandwidthtimefrom[day] == null
                          ? "Time From"
                          : instance.getbandwidthtimefrom[day]!
                              .format(context)
                              .toString(),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Icon(
                    FontAwesomeIcons.sort,
                    color: Colors.black87,
                    size: 14,
                  )
                ],
              ),
              onTap: () async {
                allDays
                    ? _provider.bandwidthischecked
                        ? _provider.bandwidthSetTimeFrom(
                            (await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            ))!,
                            day)
                        : null
                    : _provider.bandwidthischecked
                        ? null
                        : _provider.bandwidthSetTimeFrom(
                            (await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            ))!,
                            day);
              },
            ),
          ),
        ),
        Container(
          width: 100,
          child: InkWell(
            child: Row(
              children: [
                Consumer<BandwidthProvider>(
                    builder: (context, instance, child) => Text(
                          instance.getbandwidthtimeto[day] == null
                              ? "Time To"
                              : instance.getbandwidthtimeto[day]!
                                  .format(context)
                                  .toString(),
                          style: TextStyle(color: Colors.grey),
                        )),
                Icon(
                  FontAwesomeIcons.sort,
                  color: Colors.black87,
                  size: 14,
                )
              ],
            ),
            onTap: () async {
              allDays
                  ? _provider.bandwidthischecked
                      ? _provider.bandwidthSetTimeTo(
                          (await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          ))!,
                          day)
                      : null
                  : _provider.bandwidthischecked
                      ? null
                      : _provider.bandwidthSetTimeTo(
                          (await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          ))!,
                          day);
            },
          ),
        ),
      ],
    ):
    Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
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
                        onTap: () {
                          // _provider.bandwidthSetTimeFrom(null, day);
                          // _provider.bandwidthSetTimeTo(null, day);
                          _provider.bandwidthSetIsChecked =
                              !_provider.bandwidthischecked;
                        },
                        child: Consumer<BandwidthProvider>(
                          builder: (context, instance, child) => Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: instance.bandwidthischecked
                                      ? primaryColor
                                      : Colors.grey,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: Container(
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: instance.bandwidthischecked
                                      ? primaryColor
                                      : Colors.grey,
                                  border: Border.all(
                                    color: instance.bandwidthischecked
                                        ? primaryColor
                                        : Colors.grey,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(3))),
                            ),
                          ),
                        ),
                      )
                    : SizedBox.shrink(),
                Text(
                  '   $title',
                  style: TextStyle(
                      color: allDays
                          ? _provider.bandwidthischecked
                              ? Colors.black
                              : Colors.grey
                          : _provider.bandwidthIsChecked
                              ? Colors.grey
                              : Colors.black,
                      fontSize: 16),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.08),
          child: Container(
            width: 160,
            child: Consumer<BandwidthProvider>(
              builder: (context, instance, child) =>
                  DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                    ),
                    isExpanded: false,
                    focusColor: Colors.white,
                    value: instance.bandwidthDropDownValue[day] == null ? "Full Bandwidth" : instance.bandwidthDropDownValue[day],
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
                          style: TextStyle(
                            color: allDays
                                ? _provider.bandwidthischecked
                                    ? Colors.black
                                    : Colors.grey
                                : _provider.bandwidthIsChecked
                                    ? Colors.grey
                                    : Colors.black,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: allDays
                        ? _provider.bandwidthischecked
                            ? (String? value) {
                                _provider.setBandwidthDropDownValue(
                                    value!, day);
                              }
                            : null
                        : _provider.bandwidthischecked
                            ? null
                            : (String? value) {
                                _provider.setBandwidthDropDownValue(
                                    value!, day);
                              }),
              ),
            ),
          ),
        ),
          ],
        ),
        Row(
          children: [
            Padding(
          padding:
              EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.08),
          child: Container(
            width: 100,
            child: InkWell(
              child: Row(
                children: [
                  Consumer<BandwidthProvider>(
                    builder: (context, instance, child) => Text(
                      instance.getbandwidthtimefrom[day] == null
                          ? "Time From"
                          : instance.getbandwidthtimefrom[day]!
                              .format(context)
                              .toString(),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Icon(
                    FontAwesomeIcons.sort,
                    color: Colors.black87,
                    size: 14,
                  )
                ],
              ),
              onTap: () async {
                allDays
                    ? _provider.bandwidthischecked
                        ? _provider.bandwidthSetTimeFrom(
                            (await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            ))!,
                            day)
                        : null
                    : _provider.bandwidthischecked
                        ? null
                        : _provider.bandwidthSetTimeFrom(
                            (await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            ))!,
                            day);
              },
            ),
          ),
        ),
        Container(
          width: 100,
          child: InkWell(
            child: Row(
              children: [
                Consumer<BandwidthProvider>(
                    builder: (context, instance, child) => Text(
                          instance.getbandwidthtimeto[day] == null
                              ? "Time To"
                              : instance.getbandwidthtimeto[day]!
                                  .format(context)
                                  .toString(),
                          style: TextStyle(color: Colors.grey),
                        )),
                Icon(
                  FontAwesomeIcons.sort,
                  color: Colors.black87,
                  size: 14,
                )
              ],
            ),
            onTap: () async {
              allDays
                  ? _provider.bandwidthischecked
                      ? _provider.bandwidthSetTimeTo(
                          (await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          ))!,
                          day)
                      : null
                  : _provider.bandwidthischecked
                      ? null
                      : _provider.bandwidthSetTimeTo(
                          (await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          ))!,
                          day);
            },
          ),
        ),
          ],
        )
      ],
    )
    );
  }
}
