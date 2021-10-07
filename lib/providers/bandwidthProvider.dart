import 'package:flutter/material.dart';

class BandwidthProvider extends ChangeNotifier {
  bool bandwidthIsChecked = false;

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
    Map<String,String?> _bandwidthChosenValue = {
    "All Days"  : null, //1
    "Sunday"  : null, //2
    "Monday"  : null, //3
    "Tuesday"  : null, //4
    "Wednsday"  : null, //5
    "Thursday"  : null, //6
    "Friday"  : null, //7
    "Saturday"  : null, //8
  };
  bool get bandwidthischecked => bandwidthIsChecked;

  Map<String, TimeOfDay?> get getbandwidthtimefrom => bandwidthtimeFrom;
  Map<String, TimeOfDay?> get getbandwidthtimeto => bandwidthtimeTo;
  Map<String,String?> get bandwidthDropDownValue => _bandwidthChosenValue;
  

  void setBandwidthDropDownValue(String value, String day) {
    _bandwidthChosenValue[day] = value;
    notifyListeners();
  }
  set bandwidthSetIsChecked(bool ischk) {
    bandwidthIsChecked = ischk;
    notifyListeners();
  }

  void bandwidthSetTimeFrom(TimeOfDay? time,String day) {
    bandwidthtimeFrom[day] = time;
    notifyListeners();
  }

  void bandwidthSetTimeTo(TimeOfDay? time,String day) {
    bandwidthtimeTo[day] = time;
    notifyListeners();
  }
}
