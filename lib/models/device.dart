class DeviceModel {
  String? name;
  String? ip;
  String? mac;
  bool isSelected = false;

  DeviceModel({
    this.name,
    this.ip,
    this.mac,
    this.isSelected = false
  });

  void setIsSelected(bool isSelected) {
    this.isSelected = isSelected;
  }
}