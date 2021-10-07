import 'package:admin/models/connection_type.dart';
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

List<ConnectionTypeModel> getConnectionTypesList() {
    List<ConnectionTypeModel> result = [];
    if (connectionIsChecked) {
      result.add(ConnectionTypeModel(
          day: "All Days",
          type: _connectionChosenValue["All Days"],
          date: 'From ${connectiontimeFrom['All Days']?.hour}:${connectiontimeFrom['All Days']?.minute} To ${connectiontimeTo['All Days']?.hour}:${connectiontimeTo['All Days']?.minute}'));
      return result;
    }

    _connectionChosenValue.forEach((key, value) {
      if (key != 'All Days' && value != null && connectiontimeFrom[key] != null && connectiontimeFrom[key] != null) {
        result.add(ConnectionTypeModel(
            day: key,
            type: value,
            date: 'From ${connectiontimeFrom[key]?.hour}:${connectiontimeFrom[key]?.minute} To ${connectiontimeTo[key]?.hour}:${connectiontimeTo[key]?.minute}'));
      }
    });
    return result;
  }

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
