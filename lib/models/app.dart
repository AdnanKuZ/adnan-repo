class AppModel {
  String? name;
  String? title;
  String? image;
  String? link;
  bool isPredefined = true;
  bool isSelected;

  AppModel(
      {this.name,
      this.title,
      this.image,
      this.link,
      this.isPredefined = false,
      this.isSelected = false});
}
