import 'dart:convert';

import 'city.dart';

Path userFromJson(String str) => Path.fromJson(json.decode(str));

class Path {
  int id;
  City from;
  City to;
  int duration;
  double price;

  Path(
      {required this.id,
      required this.from,
      required this.to,
      required this.duration,
      required this.price});

  factory Path.fromJson(Map<String, dynamic> json) => Path(
      id: json["id"],
      from: json["from"],
      to: json["to"],
      duration: json["duration"],
      price: json["price"]);
}