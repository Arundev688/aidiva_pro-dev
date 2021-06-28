// To parse this JSON data, do
//
//     final verifyOtpResponse = verifyOtpResponseFromJson(jsonString);

import 'dart:convert';

VerifyOtpResponse verifyOtpResponseFromJson(String str) => VerifyOtpResponse.fromJson(json.decode(str));

String verifyOtpResponseToJson(VerifyOtpResponse data) => json.encode(data.toJson());

class VerifyOtpResponse {
  VerifyOtpResponse({
    this.data,
    this.emailId,
    this.message,
    this.status,
  });

  Data data;
  String emailId;
  String message;
  String status;

  factory VerifyOtpResponse.fromJson(Map<String, dynamic> json) => VerifyOtpResponse(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    emailId: json["emailId"] == null ? null : json["emailId"],
    message: json["message"] == null ? null : json["message"],
    status: json["status"] == null ? null : json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : data.toJson(),
    "emailId": emailId == null ? null : emailId,
    "message": message == null ? null : message,
    "status": status == null ? null : status,
  };
}

class Data {
  Data({
    this.bearer,
  });

  String bearer;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    bearer: json["Bearer"] == null ? null : json["Bearer"],
  );

  Map<String, dynamic> toJson() => {
    "Bearer": bearer == null ? null : bearer,
  };
}
