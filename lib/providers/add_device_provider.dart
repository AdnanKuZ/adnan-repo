import 'package:admin/models/device.dart';
import 'package:admin/models/member.dart';
import 'package:flutter/cupertino.dart';

class AddDeviceProvider extends ChangeNotifier {
  // List of devices from server
  List<DeviceModel> devices = [];
  List<DeviceModel> get getDevices => devices;
  // List of devices from server
  List<MemberModel> members = [];
  List<MemberModel> get getMembers => members;

  // Inserted device name from server
  String deviceName = '';
  String get getDeviceName => deviceName;

  // Inserted device mac from server
  String deviceMac = '';
  String get getDeviceMac => deviceMac;

  // Selected device model
  DeviceModel? selectedDeviceModel;
  DeviceModel? get getSelectedDeviceModel => selectedDeviceModel;

  // Selected memeber model
  MemberModel? selectedMemberModel;
  MemberModel? get getSelectedMemberModel => selectedMemberModel;

  void setDevices(List<DeviceModel> devices) {
    this.devices = devices;
    notifyListeners();
  }

  void setMembers(List<MemberModel> members) {
    this.members = members;
    notifyListeners();
  }

  void setDeviceName(String name) {
    this.deviceName = name;
    notifyListeners();
  }

  void setDeviceMac(String mac) {
    this.deviceMac = mac;
    notifyListeners();
  }

  void setSelectedDevice(DeviceModel? device) {
    this.selectedDeviceModel = device;
    notifyListeners();
  }

  void setSelectedMember(MemberModel? member) {
    this.selectedMemberModel = member;
    notifyListeners();
  }
}
