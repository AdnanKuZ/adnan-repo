import 'package:admin/models/member.dart';

class DeviceModel {
  String? id;
  String? name;
  String? ip;
  String? mac;
  bool isSelected = false;
  MemberModel? member;

  DeviceModel(
      {this.id,
      this.name,
      this.ip,
      this.mac,
      this.isSelected = false,
      this.member});

  factory DeviceModel.fromJson(Map<String, dynamic> json) => DeviceModel(
        id: json["macAddress"],
        name: json["name"],
        mac: json["macAddress"],
        member: json["member"] == null
            ? null
            : MemberModel.fromJson(json["member"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "member": member == null ? null : member!.toJson(),
      };

  void setIsSelected(bool isSelected) {
    this.isSelected = isSelected;
  }

  void setMember(MemberModel member) {
    this.member = member;
  }

  void setName(String name) {
    this.name = name;
  }
}
