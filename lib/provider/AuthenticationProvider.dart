import 'package:aidiva_pro/Services/Rest.dart';
import 'package:aidiva_pro/model/LoginwithMobileResponse.dart';
import 'package:aidiva_pro/model/Lookupmodel/CurrentCountryResponse.dart';
import 'package:aidiva_pro/model/RegisterResponse.dart';
import 'package:aidiva_pro/model/StatusResponse.dart';
import 'package:aidiva_pro/model/VerifyOtpResponse.dart';
import 'package:flutter/material.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class AuthenticationProvider extends ChangeNotifier {
  Status _status = Status.Uninitialized;
  Status get status => _status;
  StatusResponse statusResponse = StatusResponse();
  RegisterResponse registerResponse = RegisterResponse();
  VerifyOtpResponse verifyOtpResponse = VerifyOtpResponse();
  CurrentCountryResponse currentCountryResponse=CurrentCountryResponse();
  LoginwithMobileResponse loginwithMobileResponse=LoginwithMobileResponse();

  Future<RegisterResponse> register(String countrycode, String mobileno,
      String email, String password) async {
    await Rest().register(countrycode, mobileno, email, password).then((value) {
      _status = Status.Authenticating;
      if (value.status == "success") {
        _status = Status.Authenticated;
        registerResponse = value;
        notifyListeners();
      } else {
        _status = Status.Unauthenticated;
        registerResponse = value;
        notifyListeners();
      }
    });
    return registerResponse;
  }
  Future<VerifyOtpResponse> verifyotp(String uuid,String otp,String userType) async {
    await Rest().verifyotp(uuid,otp,userType).then((value) {
      _status = Status.Authenticating;
      if (value.status == "success") {
        _status = Status.Authenticated;
        verifyOtpResponse = value;
        notifyListeners();
      } else {
        _status = Status.Unauthenticated;
        verifyOtpResponse = value;
        notifyListeners();
      }
    });
    return verifyOtpResponse;
  }
  Future<LoginwithMobileResponse> getuserlogin(String mail, String password) async {
    _status = Status.Authenticating;
    print(_status);
    notifyListeners();
    await Rest().getLogin(mail, password).then((data) {
      if (data != null) {
        _status = Status.Authenticated;
        print(_status);
        notifyListeners();
      }else{
        _status = Status.Unauthenticated;
      }
      loginwithMobileResponse = data;
    });
    return loginwithMobileResponse;
  }

  Future<RegisterResponse> loginwithmobile(String mobileno) async {
    await Rest().loginwithmobile(mobileno).then((value) {
      _status = Status.Authenticating;
      if (value.status == "success") {
        _status = Status.Authenticated;
        registerResponse = value;
        notifyListeners();
      } else {
        _status = Status.Unauthenticated;
        registerResponse = value;
        notifyListeners();
      }
    });
    return registerResponse;
  }

  Future<CurrentCountryResponse> getcurrentcountrycode() async {
    await Rest().getcurrentcountry().then((value) {
      currentCountryResponse = value;
        notifyListeners();
      }
    );
    return currentCountryResponse;
  }
}
