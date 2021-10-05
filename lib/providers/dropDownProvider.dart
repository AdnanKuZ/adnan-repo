import 'package:flutter/cupertino.dart';

class DropDownProvider extends ChangeNotifier {
  Map<String,String> _chosenValue = {
    "All Days"  : "Full Bandwidth", //1
    "Sunday"  : "Full Bandwidth", //2
    "Monday"  : "Full Bandwidth", //3
    "Tuesday"  : "Full Bandwidth", //4
    "Wednsday"  : "Full Bandwidth", //5
    "Thursday"  : "Full Bandwidth", //6
    "Friday"  : "Full Bandwidth", //7
    "Saturday"  : "Full Bandwidth", //8
  };
  Map<String,String> get dropDownValue => _chosenValue;
  void setDropDownValue(String value, String day) {
    _chosenValue[day] = value;
    notifyListeners();
  }
}
