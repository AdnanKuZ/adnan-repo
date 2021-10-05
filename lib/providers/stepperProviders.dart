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

  void setStageState(bool stageState, int stageIndex) {
    switch (stageIndex) {
      case 1 :
        _stage1State = stageState;
      break;
      case 2 :
        _stage2State = stageState;
      break;
      case 3 :
        _stage3State = stageState;
      break;
      case 4 :
        _stage4State = stageState;
      break;
      case 5 :
        _stage5State = stageState;
      break;
    }
  }
}
