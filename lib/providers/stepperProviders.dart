import 'package:flutter/material.dart';

class StageStateProvider extends ChangeNotifier {
  bool _stage1State = false;
  bool _stage2State = false;
  bool _stage3State = false;
  bool _stage4State = false;
  bool _stage5State = false;

  bool get stage1State => _stage1State;
  bool get stage2State => _stage2State;
  bool get stage3State => _stage3State;
  bool get stage4State => _stage4State;
  bool get stage5State => _stage5State;

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
