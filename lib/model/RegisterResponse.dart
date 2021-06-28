// To parse this JSON data, do
//
//     final registerResponse = registerResponseFromJson(jsonString);

import 'dart:convert';

RegisterResponse registerResponseFromJson(String str) => RegisterResponse.fromJson(json.decode(str));

String registerResponseToJson(RegisterResponse data) => json.encode(data.toJson());

class RegisterResponse {
  RegisterResponse({
    this.data,
    this.message,
    this.status,
  });

  Data data;
  String message;
  String status;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) => RegisterResponse(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    message: json["message"] == null ? null : json["message"],
    status: json["status"] == null ? null : json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : data.toJson(),
    "message": message == null ? null : message,
    "status": status == null ? null : status,
  };
}

class Data {
  Data({
    this.otp,
    this.userType,
    this.uuid,
  });

  String otp;
  String userType;
  String uuid;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    otp: json["otp"] == null ? null : json["otp"],
    userType: json["userType"] == null ? null : json["userType"],
    uuid: json["uuid"] == null ? null : json["uuid"],
  );

  Map<String, dynamic> toJson() => {
    "otp": otp == null ? null : otp,
    "userType": userType == null ? null : userType,
    "uuid": uuid == null ? null : uuid,
  };
}
