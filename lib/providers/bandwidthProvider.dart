import 'package:admin/models/bandwidth.dart';
import 'package:flutter/material.dart';

class BandwidthProvider extends ChangeNotifier {
  bool bandwidthIsChecked = true;
  

  Map<String, TimeOfDay?> bandwidthtimeFrom = {
    "All Days": null, //1
    "Sunday": null, //2
    "Monday": null, //3
    "Tuesday": null, //4
    "Wednsday": null, //5
    "Thursday": null, //6
    "Friday": null, //7
    "Saturday": null, //8
  };
  Map<String, TimeOfDay?> bandwidthtimeTo = {
    "All Days": null, //1
    "Sunday": null, //2
    "Monday": null, //3
    "Tuesday": null, //4
    "Wednsday": null, //5
    "Thursday": null, //6
    "Friday": null, //7
    "Saturday": null, //8
  };
  Map<String, String?> _bandwidthChosenValue = {
    "All Days": 'Full Bandwidth', //1
    "Sunday": 'Full Bandwidth', //2
    "Monday": 'Full Bandwidth', //3
    "Tuesday": 'Full Bandwidth', //4
    "Wednsday": 'Full Bandwidth', //5
    "Thursday": 'Full Bandwidth', //6
    "Friday": 'Full Bandwidth', //7
    "Saturday": 'Full Bandwidth', //8
  };
  bool get bandwidthischecked => bandwidthIsChecked;

  Map<String, TimeOfDay?> get getbandwidthtimefrom => bandwidthtimeFrom;
  Map<String, TimeOfDay?> get getbandwidthtimeto => bandwidthtimeTo;
  Map<String, String?> get bandwidthDropDownValue => _bandwidthChosenValue;

  List<BandwidthModel> getBandwidthList() {
    List<BandwidthModel> result = [];
    if (bandwidthIsChecked) {
      result.add(BandwidthModel(
          day: "All Days",
          bandwidth: _bandwidthChosenValue["All Days"],
          date:
              'From ${bandwidthtimeFrom['All Days']?.hour}:${bandwidthtimeFrom['All Days']?.minute} To ${bandwidthtimeTo['All Days']?.hour}:${bandwidthtimeTo['All Days']?.minute}'));
      return result;
    }

    _bandwidthChosenValue.forEach((key, value) {
      if (key != 'All Days' &&
          value != null &&
          bandwidthtimeFrom[key] != null &&
          bandwidthtimeTo[key] != null) {
        result.add(BandwidthModel(
            day: key,
            bandwidth: value,
            date:
                'From ${bandwidthtimeFrom[key]?.hour}:${bandwidthtimeFrom[key]?.minute} To ${bandwidthtimeTo[key]?.hour}:${bandwidthtimeFrom[key]?.minute}'));
      }
    });

    print(result.toString());
    return result;
  }

  void setBandwidthDropDownValue(String value, String day) {
    _bandwidthChosenValue[day] = value;
    notifyListeners();
  }

  set bandwidthSetIsChecked(bool ischk) {
    bandwidthIsChecked = ischk;
    notifyListeners();
  }

  void bandwidthSetTimeFrom(TimeOfDay? time, String day) {
    bandwidthtimeFrom[day] = time;
    notifyListeners();
  }

  void bandwidthSetTimeTo(TimeOfDay? time, String day) {
    bandwidthtimeTo[day] = time;
    notifyListeners();
  }

  bool checkBandwidthIsValid() {
    int counter = 0;
    List<String> days = [
      "All Days",
      "Sunday",
      "Monday",
      "Tuesday",
      "Wednsday",
      "Thursday",
      "Friday",
      "Saturday",
    ];
    days.forEach((element) {
      bandwidthtimeFrom[element] != null && bandwidthtimeTo[element] != null
          ? counter = counter + 1
          : counter = counter ;
    });
    if (counter == 0)
      return false;
    else
      return true;
  }
}
