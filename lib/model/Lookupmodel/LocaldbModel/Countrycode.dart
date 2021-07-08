// To parse this JSON data, do
//
//     final countrycode = countrycodeFromMap(jsonString);

import 'dart:convert';

Countrycode countrycodeFromMap(String str) => Countrycode.fromMap(json.decode(str));

String countrycodeToMap(Countrycode data) => json.encode(data.toMap());

class Countrycode {
  Countrycode({
    this.id,
    this.key,
    this.value,
    this.type,
  });

  int id;
  String key;
  String value;
  String type;

  factory Countrycode.fromMap(Map<String, dynamic> json) => Countrycode(
    id: json["id"] == null ? null : json["id"],
    key: json["key"] == null ? null : json["key"],
    value: json["value"] == null ? null : json["value"],
    type: json["type"] == null ? null : json["type"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "key": key == null ? null : key,
    "value": value == null ? null : value,
    "type": type == null ? null : type,
  };
}
