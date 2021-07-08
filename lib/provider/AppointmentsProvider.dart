import 'package:aidiva_pro/Services/Rest.dart';
import 'package:aidiva_pro/model/AppointmentModel/AppointmentResponse.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class AppointmentsProvider extends ChangeNotifier {
  Status _status = Status.Uninitialized;
  Status get status => _status;
  AppointmentResoponse appointmentResoponse=AppointmentResoponse();
  Future<AppointmentResoponse> getappointment(String uuid, String token) async {
    await Rest().getappointments(uuid,token).then((value) {
      _status = Status.Authenticating;
      if (value.status == "success") {
        _status = Status.Authenticated;
        appointmentResoponse = value;
        notifyListeners();
      } else {
        _status = Status.Unauthenticated;
        appointmentResoponse = value;
        notifyListeners();
      }
    });
    return appointmentResoponse;
  }
}