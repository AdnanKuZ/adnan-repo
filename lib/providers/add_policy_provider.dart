import 'dart:convert';

import 'package:admin/models/app.dart';
import 'package:admin/models/device.dart';
import 'package:admin/models/member.dart';
import 'package:flutter/material.dart';

class AddPolicyProvider extends ChangeNotifier {
  String policyName = '';
  String lte = '';
  String cable = '';
  List<DeviceModel> devices = [];
  List<MemberModel> members = [];
  List<AppModel> definedApps = [
    AppModel(name: 'Netflix',   image: 'assets/images/netflix.png'),
    AppModel(name: 'Instagram', image: 'assets/images/instagram.png'),
    AppModel(name: 'Chrome',    image: 'assets/images/chrome.png'),
  ];
  List<AppModel> customApps = [
    AppModel(
        name: 'Dropbox 1',
        image: 'assets/images/chrome.png',
        link: 'http//fjdfk.com'),
    AppModel(
        name: 'Dropbox 2',
        image: 'assets/images/chrome.png',
        link: 'http//fjdfk.com'),
    AppModel(
        name: 'Dropbox 3',
        image: 'assets/images/chrome.png',
        link: 'http//fjdfk.com'),
  ];

  String get getPolicyName => policyName;
  String get getLte => lte;
  String get getCable => cable;
  List<DeviceModel> get getDevices => devices;
  List<MemberModel> get getMembers => members;
  List<AppModel> get getDefinedApps => definedApps;
  List<AppModel> get getCustomApps => customApps;

  bool allDevicesChecked = false;
  bool get getAllDevicesChecked => allDevicesChecked;

  List<MemberModel> getSelectedMemeber() {
    List<MemberModel> result = [];
    for (MemberModel member in members) {
      if (member.devices?.any((element) => element.isSelected) ?? false) {
        var selectedDevices =
            member.devices?.where((element) => element.isSelected).toList();
        selectedDevices?.forEach((element) {
          element.mac = "5:E5:49:AC:07:44";
        });
        result.add(MemberModel(
            id: member.id, name: member.name, devices: selectedDevices));
      }
    }
    result.forEach((element) {
      print(jsonEncode(element).toString());
      print(element.devices?.length);
    });
    return result;
  }

  List<DeviceModel> getSelectedDevices() {
    return devices.where((element) => element.isSelected).toList();
  }

  void addDevice(DeviceModel device) {
    devices.add(device);
    notifyListeners();
  }

  void addMember(MemberModel member) {
    members.add(member);
    notifyListeners();
  }

  void setMembers(List<MemberModel> members) {
    this.members = [];
    this.members.addAll(members);
    notifyListeners();
  }

  void setDevices(List<DeviceModel> devices) {
    this.devices = [];
    this.devices.addAll(devices);
    notifyListeners();
  }

  void setDefaultApps(List<AppModel> apps) {
    this.definedApps = apps;
    notifyListeners();
  }

  void addDefaultApp(AppModel app) {
    this.definedApps.add(app);
    notifyListeners();
  }

  void addCustomApp(AppModel app) {
    this.customApps.add(app);
    notifyListeners();
  }

  void setCustomDevices(List<AppModel> apps) {
    this.customApps = apps;
    notifyListeners();
  }

  void addMemberDevice(int index, DeviceModel device) {
    members[index].devices!.add(device);
    notifyListeners();
  }

  void setAllDevicesChecked(bool check) {
    allDevicesChecked = check;
    devices.forEach((element) {
      element.isSelected = check;
    });
    members.forEach((element) {
      element.devices?.forEach((element) {
        element.isSelected = check;
      });
    });
    notifyListeners();
  }

  void setDeviceChecked(int index, bool check) {
    devices[index].isSelected = check;
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
    if (members[memeberIndex].devices == null) {
      return false;
    }

    for (DeviceModel device in members[memeberIndex].devices!) {
      if (!device.isSelected) {
        return false;
      }
    }
    return members[memeberIndex].devices!.length > 0;
  }

  bool isDefinedAppSelected(AppModel app) {
    return definedApps
        .any((element) => element.name == app.name && element.isSelected);
  }

  bool isCustomAppSelected(AppModel app) {
    return customApps
        .any((element) => element.name == app.name && element.isSelected);
  }

  void setPolicyName(String name) {
    this.policyName = name;
  }

  // void setLte(String name) {
  //   this.lte = name;
  // }

  void setCable(String name) {
    this.cable = name;
  }

  void setCustomAppSelected(AppModel app, bool isChecked) {
    customApps.forEach((element) {
      if (app.name == element.name) {
        element.isSelected = isChecked;
      }
    });
    notifyListeners();
  }

  void setDefinedAppSelected(AppModel app, bool isChecked) {
    definedApps.forEach((element) {
      if (app.name == element.name) {
        element.isSelected = isChecked;
      }
    });
    notifyListeners();
  }

  List<AppModel> getSelectedApps() {
    List<AppModel> selectedApps = [];
    selectedApps.addAll(definedApps.where((element) => element.isSelected));
    selectedApps.forEach((element) {
      element.isPredefined = true;
    });
    selectedApps.addAll(customApps.where((element) => element.isSelected));
    return selectedApps;
  }

  List<AppModel> getSelectedDefinedApps() {
    List<AppModel> selectedApps = [];
    selectedApps.addAll(definedApps.where((element) => element.isSelected));
    return selectedApps;
  }
}
