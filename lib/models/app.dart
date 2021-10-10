class AppModel {
  String? name;
  String? image;
  String? link;
  bool isPredefined = true;
  bool isSelected;

  AppModel({
    this.name,
    this.image,
    this.link,
    this.isPredefined = false,
    this.isSelected = false
  });
}
