import 'package:admin/models/device.dart';

class MemberModel {
  String? id;
  String? name;
  List<DeviceModel>? devices;

  MemberModel({this.id, this.name, this.devices});

  factory MemberModel.fromJson(Map<String, dynamic> json) => MemberModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
