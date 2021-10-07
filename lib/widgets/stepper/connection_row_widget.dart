import 'package:admin/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:admin/widgets/common/checkboxs.dart';
import 'package:admin/providers/conncetionProvider.dart';

class ConnectionRowWidget extends StatelessWidget {
  final bool allDays;
  final String day;
  final String title;
  const ConnectionRowWidget(
      {Key? key, required this.allDays, required this.title, required this.day})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _provider =
        Provider.of<ConnectionProvider>(context,
        );
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
                        onTap: () {
                          _provider.connectionSetIsChecked =
                              !_provider.connectionischecked;
                        },
                        child: Consumer<ConnectionProvider>(
                          builder: (context,instance,child) => Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: instance.connectionischecked ? primaryColor : 
                                  Colors.grey,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: Container(
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color:
                                   instance.connectionischecked ? primaryColor : 
                                  Colors.grey,
                                  border: Border.all(
                                    color:
                                     instance.connectionischecked ? primaryColor : 
                                     Colors.grey,
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
                  style: TextStyle(color: allDays
                          ? _provider.connectionischecked
                              ? Colors.black
                              : Colors.grey
                          : _provider.connectionischecked
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
            child: Consumer<ConnectionProvider>(
              builder: (context, instance, child) =>
                  DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black,
                  ),
                  isExpanded: false,
                  focusColor: Colors.white,
                  value: instance.connectionDropDownValue[day] == null ? 'Cable':instance.connectionDropDownValue[day],
                  elevation: 10,
                  style: TextStyle(color: Colors.white),
                  iconEnabledColor: Colors.black,
                  items: <String>[
                    'Cable',
                    'LTE',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                          color: allDays
                                ? _provider.connectionischecked
                                    ? Colors.black
                                    : Colors.grey
                                : _provider.connectionischecked
                                    ? Colors.grey
                                    : Colors.black,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: allDays
                        ? _provider.connectionischecked
                            ? (String? value) {
                                _provider.setConnectionDropDownValue(
                                    value!, day);
                              }
                            : null
                        : _provider.connectionischecked
                            ? null
                            : (String? value) {
                                _provider.setConnectionDropDownValue(
                                    value!, day);
                              }
                ),
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
                    Consumer<ConnectionProvider>(
                      builder: (context,instance,child)=>Text(
                        instance.getconnectiontimefrom[day] == null
                          ? "Time From"
                          : instance.getconnectiontimefrom[day]!
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
              onTap: () async{
                allDays
                    ? _provider.connectionischecked
                        ? _provider.connectionSetTimeFrom(
                            (await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            ))!,
                            day)
                        : null
                    : _provider.connectionischecked
                        ? null
                        : _provider.connectionSetTimeFrom(
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
                Consumer<ConnectionProvider>(
                  builder: (context,instance,child)=>Text(
                    instance.getconnectiontimeto[day] == null
                              ? "Time To"
                              : instance.getconnectiontimeto[day]!
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
            onTap: () async{
              allDays
                  ? _provider.connectionischecked
                      ? _provider.connectionSetTimeTo(
                          (await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          ))!,
                          day)
                      : null
                  : _provider.connectionischecked
                      ? null
                      : _provider.connectionSetTimeTo(
                          (await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          ))!,
                          day);
            },
          ),
        ),
      ],
    ));
  }
}
