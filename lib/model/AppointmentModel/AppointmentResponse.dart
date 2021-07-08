// To parse this JSON data, do
//
//     final appointmentResoponse = appointmentResoponseFromJson(jsonString);

import 'dart:convert';

AppointmentResoponse appointmentResoponseFromJson(String str) => AppointmentResoponse.fromJson(json.decode(str));

String appointmentResoponseToJson(AppointmentResoponse data) => json.encode(data.toJson());

class AppointmentResoponse {
  AppointmentResoponse({
    this.status,
    this.data,
    this.message,
    this.totalTime,
  });

  String status;
  List<Datum> data;
  String message;
  double totalTime;

  factory AppointmentResoponse.fromJson(Map<String, dynamic> json) => AppointmentResoponse(
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
    this.appointmentUuid,
    this.category,
    this.scheduledOn,
    this.scheduledTime,
    this.scheduledPeriod,
    this.scheduledPeriodType,
    this.title,
    this.appointmentStatus,
    this.checkInTime,
    this.checkOutTime,
    this.engageStartTime,
    this.cancellationReasonCode,
    this.plannedProcedure,
    this.notes,
    this.createdOn,
    this.onOff,
    this.isCanceled,
    this.custName,
    this.custUuid,
    this.custCustomId,
    this.custMobileNo,
    this.custEmail,
    this.custCountryCode,
    this.tentUserFirstName,
    this.tentUserUuid,
    this.mastTentUuid,
    this.categoryUuid,
  });

  String appointmentUuid;
  String category;
  String scheduledOn;
  String scheduledTime;
  int scheduledPeriod;
  String scheduledPeriodType;
  dynamic title;
  int appointmentStatus;
  String checkInTime;
  String checkOutTime;
  String engageStartTime;
  String cancellationReasonCode;
  String plannedProcedure;
  String notes;
  String createdOn;
  int onOff;
  bool isCanceled;
  String custName;
  String custUuid;
  String custCustomId;
  String custMobileNo;
  String custEmail;
  String custCountryCode;
  String tentUserFirstName;
  String tentUserUuid;
  String mastTentUuid;
  String categoryUuid;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    appointmentUuid: json["appointmentUuid"] == null ? null : json["appointmentUuid"],
    category: json["category"] == null ? null : json["category"],
    scheduledOn: json["scheduledOn"] == null ? null : json["scheduledOn"],
    scheduledTime: json["scheduledTime"] == null ? null : json["scheduledTime"],
    scheduledPeriod: json["scheduledPeriod"] == null ? null : json["scheduledPeriod"],
    scheduledPeriodType: json["scheduledPeriodType"] == null ? null : json["scheduledPeriodType"],
    title: json["title"],
    appointmentStatus: json["appointmentStatus"] == null ? null : json["appointmentStatus"],
    checkInTime: json["checkInTime"] == null ? null : json["checkInTime"],
    checkOutTime: json["checkOutTime"] == null ? null : json["checkOutTime"],
    engageStartTime: json["engageStartTime"] == null ? null : json["engageStartTime"],
    cancellationReasonCode: json["cancellationReasonCode"] == null ? null : json["cancellationReasonCode"],
    plannedProcedure: json["plannedProcedure"] == null ? null : json["plannedProcedure"],
    notes: json["notes"] == null ? null : json["notes"],
    createdOn: json["createdOn"] == null ? null : json["createdOn"],
    onOff: json["onOff"] == null ? null : json["onOff"],
    isCanceled: json["isCanceled"] == null ? null : json["isCanceled"],
    custName: json["custName"] == null ? null : json["custName"],
    custUuid: json["custUuid"] == null ? null : json["custUuid"],
    custCustomId: json["custCustomId"] == null ? null : json["custCustomId"],
    custMobileNo: json["custMobileNo"] == null ? null : json["custMobileNo"],
    custEmail: json["custEmail"] == null ? null : json["custEmail"],
    custCountryCode: json["custCountryCode"] == null ? null : json["custCountryCode"],
    tentUserFirstName: json["tentUserFirstName"] == null ? null : json["tentUserFirstName"],
    tentUserUuid: json["tentUserUuid"] == null ? null : json["tentUserUuid"],
    mastTentUuid: json["mastTentUuid"] == null ? null : json["mastTentUuid"],
    categoryUuid: json["categoryUuid"] == null ? null : json["categoryUuid"],
  );

  Map<String, dynamic> toJson() => {
    "appointmentUuid": appointmentUuid == null ? null : appointmentUuid,
    "category": category == null ? null : category,
    "scheduledOn": scheduledOn == null ? null : scheduledOn,
    "scheduledTime": scheduledTime == null ? null : scheduledTime,
    "scheduledPeriod": scheduledPeriod == null ? null : scheduledPeriod,
    "scheduledPeriodType": scheduledPeriodType == null ? null : scheduledPeriodType,
    "title": title,
    "appointmentStatus": appointmentStatus == null ? null : appointmentStatus,
    "checkInTime": checkInTime == null ? null : checkInTime,
    "checkOutTime": checkOutTime == null ? null : checkOutTime,
    "engageStartTime": engageStartTime == null ? null : engageStartTime,
    "cancellationReasonCode": cancellationReasonCode == null ? null : cancellationReasonCode,
    "plannedProcedure": plannedProcedure == null ? null : plannedProcedure,
    "notes": notes == null ? null : notes,
    "createdOn": createdOn == null ? null : createdOn,
    "onOff": onOff == null ? null : onOff,
    "isCanceled": isCanceled == null ? null : isCanceled,
    "custName": custName == null ? null : custName,
    "custUuid": custUuid == null ? null : custUuid,
    "custCustomId": custCustomId == null ? null : custCustomId,
    "custMobileNo": custMobileNo == null ? null : custMobileNo,
    "custEmail": custEmail == null ? null : custEmail,
    "custCountryCode": custCountryCode == null ? null : custCountryCode,
    "tentUserFirstName": tentUserFirstName == null ? null : tentUserFirstName,
    "tentUserUuid": tentUserUuid == null ? null : tentUserUuid,
    "mastTentUuid": mastTentUuid == null ? null : mastTentUuid,
    "categoryUuid": categoryUuid == null ? null : categoryUuid,
  };
}
