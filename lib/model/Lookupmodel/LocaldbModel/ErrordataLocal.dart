// To parse this JSON data, do
//
//     final errordatalocal = errordatalocalFromMap(jsonString);

import 'dart:convert';

Errordatalocal errordatalocalFromMap(String str) => Errordatalocal.fromMap(json.decode(str));

String errordatalocalToMap(Errordatalocal data) => json.encode(data.toMap());

class Errordatalocal {
  Errordatalocal({
    this.id,
    this.key,
    this.value,
  });

  int id;
  String key;
  String value;

  factory Errordatalocal.fromMap(Map<String, dynamic> json) => Errordatalocal(
    id: json["id"] == null ? null : json["id"],
    key: json["key"] == null ? null : json["key"],
    value: json["value"] == null ? null : json["value"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "key": key == null ? null : key,
    "value": value == null ? null : value,
  };
}
