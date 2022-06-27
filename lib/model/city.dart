import 'dart:convert';

City userFromJson(String str) => City.fromJson(json.decode(str));

class City {
  int id;
  String name;
  String initials;

  City({required this.id, required this.name, required this.initials});

  factory City.fromJson(Map<String, dynamic> json) =>
      City(id: json["id"], name: json["name"], initials: json["initials"]);
}
