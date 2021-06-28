// To parse this JSON data, do
//
//     final countryLookupResponse = countryLookupResponseFromJson(jsonString);

import 'dart:convert';

CountryLookupResponse countryLookupResponseFromJson(String str) => CountryLookupResponse.fromJson(json.decode(str));

String countryLookupResponseToJson(CountryLookupResponse data) => json.encode(data.toJson());

class CountryLookupResponse {
  CountryLookupResponse({
    this.status,
    this.data,
    this.message,
    this.totalTime,
  });

  String status;
  List<Datum> data;
  String message;
  double totalTime;

  factory CountryLookupResponse.fromJson(Map<String, dynamic> json) => CountryLookupResponse(
    status: json["status"] == null ? null : json["status"],
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    message: json["message"] == null ? null : json["message"],
    totalTime: json["totalTime"] == null ? null : json["totalTime"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message == null ? null : message,
    "totalTime": totalTime == null ? null : totalTime,
  };
}

class Datum {
  Datum({
    this.mastLookupKey,
    this.mastLookupValue,
    this.mastLookupType,
  });

  String mastLookupKey;
  String mastLookupValue;
  String mastLookupType;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    mastLookupKey: json["mastLookupKey"] == null ? null : json["mastLookupKey"],
    mastLookupValue: json["mastLookupValue"] == null ? null : json["mastLookupValue"],
    mastLookupType: json["mastLookupType"] == null ? null : json["mastLookupType"],
  );

  Map<String, dynamic> toJson() => {
    "mastLookupKey": mastLookupKey == null ? null : mastLookupKey,
    "mastLookupValue": mastLookupValue == null ? null : mastLookupValue,
    "mastLookupType": mastLookupType == null ? null : mastLookupType,
  };
}
