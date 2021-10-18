import 'package:admin/models/connection_type.dart';
import 'package:admin/models/metadata.dart';
import 'package:flutter/material.dart';

class ConnectionProvider extends ChangeNotifier {
  bool connectionIsChecked = true;

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
  Map<String, Port?> _connectionChosenValue = {
    "All Days": null, //1
    "Sunday": null, //2
    "Monday": null, //3
    "Tuesday": null, //4
    "Wednsday": null, //5
    "Thursday": null, //6
    "Friday": null, //7
    "Saturday": null, //8
  };
  bool get connectionischecked => connectionIsChecked;

  Map<String, TimeOfDay?> get getconnectiontimefrom => connectiontimeFrom;
  Map<String, TimeOfDay?> get getconnectiontimeto => connectiontimeTo;
  Map<String, Port?> get connectionDropDownValue => _connectionChosenValue;

  List<ConnectionTypeModel> getConnectionTypesList() {
    List<ConnectionTypeModel> result = [];
    if (connectionIsChecked) {
      result.add(ConnectionTypeModel(
          day: "All Days",
          type: _connectionChosenValue["All Days"]?.name,
          port: _connectionChosenValue["All Days"],
          date:
              'From ${connectiontimeFrom['All Days']?.hour}:${connectiontimeFrom['All Days']?.minute} To ${connectiontimeTo['All Days']?.hour}:${connectiontimeTo['All Days']?.minute}'));
      return result;
    }

    _connectionChosenValue.forEach((key, value) {
      print(
          'day: ${key} - value: ${value} - from: ${connectiontimeFrom[key]?.hour}:${connectiontimeFrom[key]?.minute} - to: ${connectiontimeTo[key]?.hour}:${connectiontimeTo[key]?.minute}');
      if (key != 'All Days' &&
          value != null &&
          connectiontimeFrom[key] != null &&
          connectiontimeTo[key] != null) {
        result.add(ConnectionTypeModel(
            day: key,
            type: value.name,
            port: value,
            date:
                'From ${connectiontimeFrom[key]?.hour}:${connectiontimeFrom[key]?.minute} To ${connectiontimeTo[key]?.hour}:${connectiontimeTo[key]?.minute}'));
      }
    });
    return result;
  }

  void setConnectionDropDownValue(Port? value, String day) {
    _connectionChosenValue[day] = value;
    notifyListeners();
  }

  void setConnectionDropDownValueForAllDays(Port value) {
    _connectionChosenValue.forEach((key, v) {
      _connectionChosenValue[key] = value;
    });

    notifyListeners();
  }

  set connectionSetIsChecked(bool ischk) {
    connectionIsChecked = ischk;
    notifyListeners();
  }

  void connectionSetTimeFrom(TimeOfDay? time, String day) {
    connectiontimeFrom[day] = time;
    notifyListeners();
  }

  void connectionSetTimeTo(TimeOfDay? time, String day) {
    connectiontimeTo[day] = time;
    notifyListeners();
  }

  bool checkConnectionIsValid() {
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
      connectiontimeFrom[element] != null && connectiontimeTo[element] != null
          ? counter = counter + 1
          : counter = counter;
    });
    if (counter == 0)
      return false;
    else
      return true;
  }

  void abortconnection() {
    connectiontimeFrom.forEach((key, value) {
      connectionSetTimeFrom(null, key);
    });
    connectiontimeTo.forEach((key, value) {
      connectionSetTimeTo(null, key);
    });
    _connectionChosenValue.forEach((key, value) {
      setConnectionDropDownValue(null, key);
    });
    notifyListeners();
  }
}
