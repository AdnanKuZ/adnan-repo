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

  void incrementIndex() {
    if (_currentStep < 4) {
      _currentStep = _currentStep ++;
      notifyListeners();
    }
  }
}
