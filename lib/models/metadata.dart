// To parse this JSON data, do
//
//     final metadataModel = metadataModelFromJson(jsonString);

import 'dart:convert';


MetadataModel metadataModelFromJson(String str) => MetadataModel.fromJson(json.decode(str));

// String metadataModelToJson(MetadataModel data) => json.encode(data.toJson());

class MetadataModel {
    MetadataModel({
        this.ports,
        this.bandwidthSpeeds,
        this.cpeIdentifier
    });

    List<Port>? ports;
    List<BandwidthSpeed>? bandwidthSpeeds;
    String? cpeIdentifier;

    factory MetadataModel.fromJson(Map<String, dynamic> json) => MetadataModel(
        ports: List<Port>.from(json["ports"].map((x) => Port.fromJson(x))),
        bandwidthSpeeds: List<BandwidthSpeed>.from(json["bandwidthSpeeds"].map((x) => BandwidthSpeed.fromJson(x))),
        cpeIdentifier: json["cpeIdentifier"],
    );

//     Map<String, dynamic> toJson() => {
//         "ports": List<dynamic>.from(ports.map((x) => x.toJson())),
//         "maxBandwidth": maxBandwidth,
//         "cpeIdentifier": cpeIdentifier,
//     };
}

class Port {
    Port({
        this.title,
        this.name,
        this.isLte,
    });

    String? title;
    String? name;
    bool? isLte;

    factory Port.fromJson(Map<String, dynamic> json) => Port(
        title: json["title"],
        name: json["name"],
        isLte: json["isLte"],
    );

    // Map<String, dynamic> toJson() => {
    //     "title": title,
    //     "name": name,
    //     "isLte": isLte,
    }
class BandwidthSpeed {
    BandwidthSpeed({
        this.name,
        this.value,
    });

    String? name;
    int? value;

    factory BandwidthSpeed.fromJson(Map<String, dynamic> json) => BandwidthSpeed(
        name: json["name"],
        value: json["value"],
    );

    // Map<String, dynamic> toJson() => {
    //     "name": name,
    //     "value": value,
    // };
}
