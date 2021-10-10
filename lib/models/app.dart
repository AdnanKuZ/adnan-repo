class AppModel {
  String? name;
  String? image;
  String? link;
  bool? isPredefined;
  bool isSelected;

  AppModel({
    this.name,
    this.image,
    this.link,
    this.isPredefined,
    this.isSelected = false
  });
}
