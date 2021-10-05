import 'package:admin/models/device.dart';
import 'package:admin/models/member.dart';
import 'package:flutter/material.dart';

class StageStateProvider extends ChangeNotifier {
  List<DeviceModel> devices = [];
  List<MemberModel> members = [];
  List<DeviceModel> get getDevices => devices;
  List<MemberModel> get getMembers => members;

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
      case 1:
        _stage1State = stageState;
        break;
      case 2:
        _stage2State = stageState;
        break;
      case 3:
        _stage3State = stageState;
        break;
      case 4:
        _stage4State = stageState;
        break;
      case 5:
        _stage5State = stageState;
        break;
    }
  }

  void addDevice(DeviceModel device) {
    devices.add(device);
    notifyListeners();
  }

  void addMember(MemberModel member) {
    members.add(member);
    notifyListeners();
  }
  
  void addMemberDevice(int index, DeviceModel device) {
    members[index].devices!.add(device);
    notifyListeners();
  }
}