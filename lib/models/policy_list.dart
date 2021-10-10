// To parse this JSON data, do
//
//     final policyListModel = policyListModelFromJson(jsonString);

import 'dart:convert';

List<PolicyListModel> policyListModelFromJson(String str) => List<PolicyListModel>.from(json.decode(str).map((x) => PolicyListModel.fromJson(x)));

String policyListModelToJson(List<PolicyListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PolicyListModel {
    PolicyListModel({
        this.userIds,
        this.deviceMacAddresses,
        this.devices,
        this.lteBandwidth,
        this.cableBandwidth,
        this.bandwidths,
        this.interfaces,
        this.apps,
        this.customApps,
    });

    List<String>? userIds;
    List<String>? deviceMacAddresses;
    List<Device>? devices;
    int? lteBandwidth;
    int? cableBandwidth;
    List<Bandwidth>? bandwidths;
    List<Interface>? interfaces;
    List<String>? apps;
    List<String>? customApps;

    factory PolicyListModel.fromJson(Map<String, dynamic> json) => PolicyListModel(
        userIds: List<String>.from(json["userIds"].map((x) => x)),
        deviceMacAddresses: List<String>.from(json["deviceMacAddresses"].map((x) => x)),
        devices: List<Device>.from(json["devices"].map((x) => Device.fromJson(x))),
        lteBandwidth: json["lteBandwidth"],
        cableBandwidth: json["cableBandwidth"],
        bandwidths: List<Bandwidth>.from(json["bandwidths"].map((x) => Bandwidth.fromJson(x))),
        interfaces: List<Interface>.from(json["interfaces"].map((x) => Interface.fromJson(x))),
        apps: List<String>.from(json["apps"].map((x) => x)),
        customApps: List<String>.from(json["customApps"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "userIds": List<dynamic>.from(userIds!.map((x) => x)),
        "deviceMacAddresses": List<dynamic>.from(deviceMacAddresses!.map((x) => x)),
        "devices": List<dynamic>.from(devices!.map((x) => x.toJson())),
        "lteBandwidth": lteBandwidth,
        "cableBandwidth": cableBandwidth,
        "bandwidths": List<dynamic>.from(bandwidths!.map((x) => x.toJson())),
        "interfaces": List<dynamic>.from(interfaces!.map((x) => x.toJson())),
        "apps": List<dynamic>.from(apps!.map((x) => x)),
        "customApps": List<dynamic>.from(customApps!.map((x) => x)),
    };
}

class Bandwidth {
    Bandwidth({
        this.value,
        this.schedule,
    });

    int? value;
    Schedule? schedule;

    factory Bandwidth.fromJson(Map<String, dynamic> json) => Bandwidth(
        value: json["value"],
        schedule: Schedule.fromJson(json["schedule"]),
    );

    Map<String, dynamic> toJson() => {
        "value": value,
        "schedule": schedule!.toJson(),
    };
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
    Map<String, int>? startTime;
    Map<String, int>? endTime;

    factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        day: json["day"],
        allDays: json["allDays"],
        startTime: Map.from(json["startTime"]).map((k, v) => MapEntry<String, int>(k, v)),
        endTime: Map.from(json["endTime"]).map((k, v) => MapEntry<String, int>(k, v)),
    );

    Map<String, dynamic> toJson() => {
        "day": day,
        "allDays": allDays,
        "startTime": Map.from(startTime!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "endTime": Map.from(endTime!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    };
}

class Device {
    Device({
        this.name,
        this.macAddress,
        this.member,
    });

    String? name;
    String? macAddress;
    Member? member;

    factory Device.fromJson(Map<String, dynamic> json) => Device(
        name: json["name"],
        macAddress: json["macAddress"],
        member: Member.fromJson(json["member"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "macAddress": macAddress,
        "member": member!.toJson(),
    };
}

class Member {
    Member({
        this.id,
        this.name,
    });

    String? id;
    String? name;

    factory Member.fromJson(Map<String, dynamic> json) => Member(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
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

    Map<String, dynamic> toJson() => {
        "portName": portName,
        "schedule": schedule!.toJson(),
    };
}
