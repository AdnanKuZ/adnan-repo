// To parse this JSON data, do
//
//     final policyListModel = policyListModelFromJson(jsonString);

import 'dart:convert';

List<PolicyListModel> policyListModelFromJson(String str) => List<PolicyListModel>.from(json.decode(str).map((x) => PolicyListModel.fromJson(x)));

String policyListModelToJson(List<PolicyListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PolicyListModel {
    PolicyListModel({
        this.id,
        this.cpeIdentifier,
        this.devices,
        this.lteBandwidth,
        this.cableBandwidth,
        this.bandwidths,
        this.interfaces,
        this.apps,
        this.customApps,
    });

    String? id;
    String? cpeIdentifier;
    List<dynamic>? devices;
    int? lteBandwidth;
    int? cableBandwidth;
    List<Bandwidth>? bandwidths;
    List<Interface>? interfaces;
    List<dynamic>? apps;
    List<String>? customApps;

    factory PolicyListModel.fromJson(Map<String, dynamic> json) => PolicyListModel(
        id: json["id"],
        cpeIdentifier: json["cpeIdentifier"],
        devices: List<dynamic>.from(json["devices"].map((x) => x)),
        lteBandwidth: json["lteBandwidth"],
        cableBandwidth: json["cableBandwidth"],
        bandwidths: List<Bandwidth>.from(json["bandwidths"].map((x) => Bandwidth.fromJson(x))),
        interfaces: List<Interface>.from(json["interfaces"].map((x) => Interface.fromJson(x))),
        apps: List<dynamic>.from(json["apps"].map((x) => x)),
        customApps: List<String>.from(json["customApps"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "cpeIdentifier": cpeIdentifier,
        "devices": List<dynamic>.from(devices!.map((x) => x)),
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

    double? value;
    Schedule? schedule;

    factory Bandwidth.fromJson(Map<String, dynamic> json) => Bandwidth(
        value: json["value"].toDouble(),
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
    String? startTime;
    String? endTime;

    factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        day: json["day"],
        allDays: json["allDays"],
        startTime: json["startTime"],
        endTime: json["endTime"],
    );

    Map<String, dynamic> toJson() => {
        "day": day,
        "allDays": allDays,
        "startTime": startTime,
        "endTime": endTime,
    };
}

class Interface {
    Interface({
        this.schedule,
    });

    Schedule? schedule;

    factory Interface.fromJson(Map<String, dynamic> json) => Interface(
        schedule: Schedule.fromJson(json["schedule"]),
    );

    Map<String, dynamic> toJson() => {
        "schedule": schedule!.toJson(),
    };
}
