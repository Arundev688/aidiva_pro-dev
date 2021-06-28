// To parse this JSON data, do
//
//     final loginwithMobileResponse = loginwithMobileResponseFromJson(jsonString);

import 'dart:convert';

LoginwithMobileResponse loginwithMobileResponseFromJson(String str) => LoginwithMobileResponse.fromJson(json.decode(str));

String loginwithMobileResponseToJson(LoginwithMobileResponse data) => json.encode(data.toJson());

class LoginwithMobileResponse {
  LoginwithMobileResponse({
    this.data,
    this.isPractice,
    this.isEmail,
    this.isWelcome,
    this.bearer,
    this.message,
    this.isOtp,
    this.status,
    this.isTodayFirst,
  });

  Data data;
  bool isPractice;
  bool isEmail;
  bool isWelcome;
  String bearer;
  String message;
  bool isOtp;
  String status;
  bool isTodayFirst;

  factory LoginwithMobileResponse.fromJson(Map<String, dynamic> json) => LoginwithMobileResponse(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    isPractice: json["isPractice"] == null ? null : json["isPractice"],
    isEmail: json["isEmail"] == null ? null : json["isEmail"],
    isWelcome: json["isWelcome"] == null ? null : json["isWelcome"],
    bearer: json["bearer"] == null ? null : json["bearer"],
    message: json["message"] == null ? null : json["message"],
    isOtp: json["isOtp"] == null ? null : json["isOtp"],
    status: json["status"] == null ? null : json["status"],
    isTodayFirst: json["isTodayFirst"] == null ? null : json["isTodayFirst"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : data.toJson(),
    "isPractice": isPractice == null ? null : isPractice,
    "isEmail": isEmail == null ? null : isEmail,
    "isWelcome": isWelcome == null ? null : isWelcome,
    "bearer": bearer == null ? null : bearer,
    "message": message == null ? null : message,
    "isOtp": isOtp == null ? null : isOtp,
    "status": status == null ? null : status,
    "isTodayFirst": isTodayFirst == null ? null : isTodayFirst,
  };
}

class Data {
  Data({
    this.otp,
    this.userType,
    this.uuid,
  });

  dynamic otp;
  String userType;
  String uuid;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    otp: json["otp"],
    userType: json["userType"] == null ? null : json["userType"],
    uuid: json["uuid"] == null ? null : json["uuid"],
  );

  Map<String, dynamic> toJson() => {
    "otp": otp,
    "userType": userType == null ? null : userType,
    "uuid": uuid == null ? null : uuid,
  };
}
