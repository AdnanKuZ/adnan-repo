// To parse this JSON data, do
//
//     final metadataModel = metadataModelFromJson(jsonString);

import 'dart:convert';

MetadataModel metadataModelFromJson(String str) => MetadataModel.fromJson(json.decode(str));

// String metadataModelToJson(MetadataModel data) => json.encode(data.toJson());

class MetadataModel {
    MetadataModel({
        this.ports,
        this.maxBandwidth,
    });

    List<Port>? ports;
    int? maxBandwidth;

    factory MetadataModel.fromJson(Map<String, dynamic> json) => MetadataModel(
        ports: List<Port>.from(json["ports"].map((x) => Port.fromJson(x))),
        maxBandwidth: json["maxBandwidth"],
    );

//     Map<String, dynamic> toJson() => {
//         "ports": List<dynamic>.from(ports.map((x) => x.toJson())),
//         "maxBandwidth": maxBandwidth,
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

