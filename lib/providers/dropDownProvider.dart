import 'package:flutter/cupertino.dart';

class DropDownProvider extends ChangeNotifier {

  Map<String,String> _bandwidthChosenValue = {
    "All Days"  : "Full Bandwidth", //1
    "Sunday"  : "Full Bandwidth", //2
    "Monday"  : "Full Bandwidth", //3
    "Tuesday"  : "Full Bandwidth", //4
    "Wednsday"  : "Full Bandwidth", //5
    "Thursday"  : "Full Bandwidth", //6
    "Friday"  : "Full Bandwidth", //7
    "Saturday"  : "Full Bandwidth", //8
  };
  Map<String,String> _connectionChosenValue = {
    "All Days"  : "Cable", //1  
    "Sunday"  : "Cable", //2
    "Monday"  : "Cable", //3
    "Tuesday"  : "Cable", //4
    "Wednsday"  : "Cable", //5
    "Thursday"  : "Cable", //6
    "Friday"  : "Cable", //7
    "Saturday"  : "Cable", //8
  };
  Map<String,String> get bandwidthDropDownValue => _bandwidthChosenValue;
  Map<String,String> get connectionDropDownValue => _connectionChosenValue;

  void setBandwidthDropDownValue(String value, String day) {
    _bandwidthChosenValue[day] = value;
    notifyListeners();
  }
  void setConnectionDropDownValue(String value, String day) {
    _connectionChosenValue[day] = value;
    notifyListeners();
  }
}
