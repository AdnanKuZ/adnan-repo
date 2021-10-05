import 'package:flutter/material.dart';

class StageProvider extends ChangeNotifier {
  List<bool> _stageStates = [false, false, false, false, false];
  int _currentStep = 0;

  List<bool> get stageStates => _stageStates;

  int get stageIndex => _currentStep;

  set setStageState(int stageIndex) {
    _stageStates[stageIndex] = true;
    notifyListeners();
  }

  set setStageIndex(int index) {
    if (_currentStep <= 3) {
      _currentStep = index;

      notifyListeners();
    }
  }
}
