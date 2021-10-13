import 'package:flutter/material.dart';

class StageProvider extends ChangeNotifier {
  List<bool> _stageStates = [false, false, false, false, false];
  int _currentStep = 3;
  bool _isLastStep = false;

  List<bool> get stageStates => _stageStates;

  bool get islaststep => _isLastStep;

  int get stageIndex => _currentStep;

  set setStageState(int stageIndex) {
    _stageStates[stageIndex] = true;
    notifyListeners();
  }

  void setStageStateFalse(int stageIndex) {
    _stageStates[stageIndex] = false;
    notifyListeners();
  }

  void setStagesStateFalse() {
    _stageStates = [false, false, false, false, false];
    notifyListeners();
  }

  set setIsLastStep(bool islststp) {
    _isLastStep = islststp;
    notifyListeners();
  }

  void incrementIndex() {
    // if (_currentStep < 4) {
    _currentStep = _currentStep + 1;
    notifyListeners();
  }

  set setIndex(int index) {
    _currentStep = index;
    notifyListeners();
  }
}
