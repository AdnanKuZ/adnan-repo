import 'package:admin/constants.dart';
import 'package:admin/dialogs/auth_error_dialog.dart';
import 'package:admin/models/metadata.dart';
import 'package:admin/providers/bandwidthProvider.dart';
import 'package:admin/providers/metaDataProvider.dart';
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
      {Key? key,
      required this.allDays,
      required this.title,
      required this.day,
      this.constraints})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<BandwidthProvider>(context);
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
            child: Consumer2<BandwidthProvider, MetadataProvider>(
              builder: (context, instance, metaInstance, child) =>
                  DropdownButtonHideUnderline(
                child: DropdownButton<BandwidthSpeed>(
                    dropdownColor: Color(0xFFF8F8F8),
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                    ),
                    isExpanded: false,
                    focusColor: Colors.white,
                    hint: instance.bandwidthDropDownValue[day] == null
                        ? Text(
                            'None',
                            style: TextStyle(
                              color: allDays
                                  ? _provider.bandwidthIsChecked
                                      ? Colors.black
                                      : Colors.grey
                                  : _provider.bandwidthIsChecked
                                      ? Colors.grey
                                      : Colors.black,
                            ),
                          )
                        : Text(
                            instance.bandwidthDropDownValue[day]!.name
                                .toString().trim(),
                            style: TextStyle(
                              color: allDays
                                  ? _provider.bandwidthIsChecked
                                      ? Colors.black
                                      : Colors.grey
                                  : _provider.bandwidthIsChecked
                                      ? Colors.grey
                                      : Colors.black,
                            )),
                    elevation: 10,
                    style: TextStyle(color: Colors.white),
                    iconEnabledColor: Colors.black,
                    items: metaInstance.getmetadata["bandwidthSpeeds"]
                        .map<DropdownMenuItem<BandwidthSpeed>>(
                            (BandwidthSpeed value) {
                      return DropdownMenuItem<BandwidthSpeed>(
                        value: value,
                        child: Text(
                          value.name!.trim(),
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
                            ? (BandwidthSpeed? value) {
                                _provider.setBandwidthDropDownValue(
                                    value!, day);
                              }
                            : null
                        : _provider.bandwidthischecked
                            ? null
                            : (BandwidthSpeed? value) {
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
                      ? setTimeTo(_provider, day, context)
                      // _provider.bandwidthSetTimeTo(
                      //     (await showTimePicker(
                      //       context: context,
                      //       initialTime: TimeOfDay.now(),
                      //     ))!,
                      //     day)
                      : null
                  : _provider.bandwidthischecked
                      ? null
                      : setTimeTo(_provider, day, context);
              // _provider.bandwidthSetTimeTo(
              //     (await showTimePicker(
              //       context: context,
              //       initialTime: TimeOfDay.now(),
              //     ))!,
              //     day);
            },
          ),
        ),
      ],
    ));
  }

  double convertTo24(double time, DayPeriod period) {
    if (period == DayPeriod.am) {
      return time;
    } else {
      return time + 12;
    }
  }

  void setTimeTo(
      BandwidthProvider provider, String day, BuildContext context) async {
    TimeOfDay timeTo = TimeOfDay.now();

    if (provider.bandwidthtimeFrom[day] != null) {
      TimeOfDay timeFrom = (provider.bandwidthtimeFrom[day])!;
      timeTo = (await showTimePicker(
          context: context, initialTime: TimeOfDay.now()))!;

      var timeFrom24Format =
          convertTo24((timeFrom.hour + timeFrom.minute / 60), timeFrom.period);
      print("from $timeFrom24Format");

      var timeTo24Format =
          convertTo24((timeTo.hour + timeTo.minute / 60), timeTo.period);
      print("to $timeTo24Format");

      if ((timeTo24Format - timeFrom24Format) > 0) {
        provider.bandwidthSetTimeTo(timeTo, day);
      } else {
        showDialog(
            context: context,
            builder: (context) => AuthDialog(
                  title: 'Please Choose a valid time within the same day',
                ));
      }
    }
  }
}
