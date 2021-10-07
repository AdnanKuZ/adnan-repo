import 'package:flutter/material.dart';

class ConnectionProvider extends ChangeNotifier {
  bool connectionIsChecked = false;

  Map<String, TimeOfDay?> connectiontimeFrom = {
    "All Days": null, //1
    "Sunday": null, //2
    "Monday": null, //3
    "Tuesday": null, //4
    "Wednsday": null, //5
    "Thursday": null, //6
    "Friday": null, //7
    "Saturday": null, //8
  };
  Map<String, TimeOfDay?> connectiontimeTo = {
    "All Days": null, //1
    "Sunday": null, //2
    "Monday": null, //3
    "Tuesday": null, //4
    "Wednsday": null, //5
    "Thursday": null, //6
    "Friday": null, //7
    "Saturday": null, //8
  };
  Map<String,String?> _connectionChosenValue = {
    "All Days"  : null, //1  
    "Sunday"  : null, //2
    "Monday"  : null, //3
    "Tuesday"  : null, //4
    "Wednsday"  : null, //5
    "Thursday"  : null, //6
    "Friday"  : null, //7
    "Saturday"  : null, //8
  };
  bool get connectionischecked => connectionIsChecked;

  Map<String, TimeOfDay?> get getconnectiontimefrom => connectiontimeFrom;
  Map<String, TimeOfDay?> get getconnectiontimeto => connectiontimeTo;
  Map<String,String?> get connectionDropDownValue => _connectionChosenValue;

  void setConnectionDropDownValue(String value, String day) {
    _connectionChosenValue[day] = value;
    notifyListeners();
  }
  set connectionSetIsChecked(bool ischk) {
    connectionIsChecked = ischk;
    notifyListeners();
  }

  void connectionSetTimeFrom(TimeOfDay? time,String day) {
    connectiontimeFrom[day] = time;
    notifyListeners();
  }

  void connectionSetTimeTo(TimeOfDay? time,String day) {
    connectiontimeTo[day] = time;
    notifyListeners();
  }
}
