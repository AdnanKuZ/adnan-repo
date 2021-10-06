import 'package:admin/models/device.dart';
import 'package:admin/models/member.dart';
import 'package:flutter/material.dart';

class MembersAndDevicesStepProvider extends ChangeNotifier {
  List<DeviceModel> devices = [];
  List<MemberModel> members = [];
  // List<DeviceModel> devices = [
  //   DeviceModel(name: "Bedroom TV"),
  //   DeviceModel(name: "Playstation 3"),
  //   DeviceModel(name: "Playstation 4"),
  // ];
  // List<MemberModel> members = [
  //   MemberModel(name: 'Ziad', devices: [
  //     DeviceModel(name: 'Lenovo Thinkpad'),
  //     DeviceModel(name: 'iphone 13 Pro Max'),
  //     DeviceModel(name: 'School Device'),
  //   ]),
  //   MemberModel(name: 'Jessy', devices: [
  //     DeviceModel(name: 'Lenovo Thinkpad'),
  //     DeviceModel(name: 'iphone 13 Pro Max'),
  //     DeviceModel(name: 'School Device'),
  //   ]),
  //   MemberModel(name: 'Khalid', devices: [
  //     DeviceModel(name: 'Lenovo Thinkpad'),
  //     DeviceModel(name: 'iphone 13 Pro Max'),
  //     DeviceModel(name: 'School Device'),
  //   ]),
  //   MemberModel(name: 'Majd', devices: [
  //     DeviceModel(name: 'Lenovo Thinkpad'),
  //     DeviceModel(name: 'iphone 13 Pro Max'),
  //     DeviceModel(name: 'School Device'),
  //   ])
  // ];
  List<DeviceModel> get getDevices => devices;
  List<MemberModel> get getMembers => members;

  bool areDevicesChecked = false;
  bool get getAreDevicesChecked => areAllDevicesChecked();

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

  bool areAllDevicesChecked() {
    for (DeviceModel device in devices) {
      if (!device.isSelected) return false;
    }
    return true;
  }

  void setAllDevicesChecked(bool check) {
    for (DeviceModel device in devices) {
      device.isSelected = check;
    }
    areDevicesChecked = areAllDevicesChecked();
    notifyListeners();
  }

  void setDeviceChecked(int index, bool check) {
    devices[index].isSelected = check;
    areDevicesChecked = areAllDevicesChecked();
    notifyListeners();
  }

  void setMemberDeviceChecked(int memberIndex, int deviceIndex, bool check) {
    members[memberIndex].devices?[deviceIndex].isSelected = check;
    notifyListeners();
  }

  void setAllMemberDevicesChecked(int memberIndex, bool check) {
    for (DeviceModel device in members[memberIndex].devices!) {
      device.isSelected = check;
    }
    notifyListeners();
  }

  bool areAllMemberDevicesChecked(int memeberIndex) {
    for (DeviceModel device in members[memeberIndex].devices!) {
      if (!device.isSelected) {
        return false;
      }
    }
    
    return members[memeberIndex].devices!.length > 0;
  }
}
