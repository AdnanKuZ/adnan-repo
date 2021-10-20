import 'dart:convert';

class Application {
  Application({this.name, this.title, this.image});

  String? image;
  String? name;
  String? title;

  factory Application.fromRawJson(String str) =>
      Application.fromJson(json.decode(str));

  // String toRawJson() => json.encode(toJson());

  factory Application.fromJson(Map<String, dynamic> json) => Application(
    image: json["image"] == null ? null : json["image"],  ////change json depending on api
        name: json["name"] == null ? null : json["name"],
        title: json["title"] == null ? null : json["title"],
      );

  // Map<String, dynamic> toJson() => {
  //       "name": name == null ? null : name,
  //       "title": title == null ? null : title,
  //     };
}
