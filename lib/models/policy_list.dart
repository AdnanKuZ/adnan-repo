// To parse this JSON data, do
//
//     final policyListModel = policyListModelFromJson(jsonString);

import 'dart:convert';

import 'package:admin/models/device.dart';

List<PolicyListModel> policyListModelFromJson(String str) =>
    List<PolicyListModel>.from(
        json.decode(str).map((x) => PolicyListModel.fromJson(x)));

// String policyListModelToJson(List<PolicyListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PolicyListModel {
  PolicyListModel({
    this.id,
    this.title,
    this.cpeIdentifier,
    this.devices,
    this.lteBandwidth,
    this.cableBandwidth,
    this.bandwidths,
    this.interfaces,
    this.apps,
    this.customApps,
    this.userIds,
  });

  String? id;
  String? title;
  String? cpeIdentifier;
  List<DeviceModel>? devices;
  int? lteBandwidth;
  int? cableBandwidth;
  List<Bandwidth>? bandwidths;
  List<Interface>? interfaces;
  List<dynamic>? apps;
  List<String>? customApps;
  List<String>? userIds;

  factory PolicyListModel.fromJson(Map<String, dynamic> json) =>
      PolicyListModel(
        id: json["id"],
        title: json["title"] == null ? null : json["title"],
        cpeIdentifier: json["cpeIdentifier"],
        devices: json["devices"].map<DeviceModel>((device) => DeviceModel.fromJson(device)).toList(),
        lteBandwidth: json["lteBandwidth"],
        cableBandwidth: json["cableBandwidth"],
        bandwidths: json["bandwidths"] == null
            ? null
            : List<Bandwidth>.from(
                json["bandwidths"].map((x) => Bandwidth.fromJson(x))),
        interfaces: json["interfaces"] == null
            ? null
            : List<Interface>.from(
                json["interfaces"].map((x) => Interface.fromJson(x))),
        apps: json["apps"] == null
            ? null
            : List<dynamic>.from(json["apps"].map((x) => x)),
        customApps: json["customApps"] == null
            ? null
            : List<String>.from(json["customApps"].map((x) => x)),
        userIds: json["userIds"] == null
            ? null
            : List<String>.from(json["userIds"].map((x) => x)),
      );

  // Map<String, dynamic> toJson() => {
  //     "id": id,
  //     "cpeIdentifier": cpeIdentifier,
  //     "devices": List<dynamic>.from(devices.map((x) => x)),
  //     "lteBandwidth": lteBandwidth,
  //     "cableBandwidth": cableBandwidth,
  //     "bandwidths": bandwidths == null ? null : List<dynamic>.from(bandwidths.map((x) => x.toJson())),
  //     "interfaces": interfaces == null ? null : List<dynamic>.from(interfaces.map((x) => x.toJson())),
  //     "apps": apps == null ? null : List<dynamic>.from(apps.map((x) => x)),
  //     "customApps": customApps == null ? null : List<dynamic>.from(customApps.map((x) => x)),
  //     "userIds": userIds == null ? null : List<dynamic>.from(userIds.map((x) => x)),
  // };
}

class Bandwidth {
  Bandwidth({
    this.value,
    this.schedule,
  });

  double? value;
  Schedule? schedule;

  String getBandwidthName() {
    switch (value?.round()) {
      case 3:
        return 'Full Bandwidth';
      case 2:
        return 'Medium Bandwidth';
      case 1:
        return 'Small Bandwidth';
      case 0:
        return 'Block';
    }
    return 'Block';
  }

  factory Bandwidth.fromJson(Map<String, dynamic> json) => Bandwidth(
        value: json["value"].toDouble(),
        schedule: Schedule.fromJson(json["schedule"]),
      );

  // Map<String, dynamic> toJson() => {
  //     "value": value,
  //     "schedule": schedule.toJson(),
  // };
}

class Schedule {
  Schedule({
    this.day,
    this.allDays,
    this.startTime,
    this.endTime,
  });

  int? day;
  bool? allDays;
  String? startTime;
  String? endTime;

  String getDayName() {
    if(allDays!) {
      return 'All Days';
    }
    
    switch (day) {
      case 0:
        return 'Sun';
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      default:
        return 'All Days';
    }
  }

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        day: json["day"],
        allDays: json["allDays"],
        startTime: json["startTime"],
        endTime: json["endTime"],
      );

  // Map<String, dynamic> toJson() => {
  //     "day": day,
  //     "allDays": allDays,
  //     "startTime": startTime,
  //     "endTime": endTime,
  // };
}

class Interface {
  Interface({
    this.portName,
    this.schedule,
  });

  String? portName;
  Schedule? schedule;

  factory Interface.fromJson(Map<String, dynamic> json) => Interface(
        portName: json["portName"],
        schedule: Schedule.fromJson(json["schedule"]),
      );

  // Map<String, dynamic> toJson() => {
  //     "schedule": schedule.toJson(),
  // };
}
