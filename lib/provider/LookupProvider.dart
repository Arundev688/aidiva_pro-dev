import 'package:aidiva_pro/Services/Rest.dart';
import 'package:aidiva_pro/model/Lookupmodel/CountryCodeLengthResponse.dart';
import 'package:aidiva_pro/model/Lookupmodel/CountryLookupResponse.dart';
import 'package:aidiva_pro/model/Lookupmodel/ErrorResponse.dart';
import 'package:flutter/material.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }
class LookupProvider extends ChangeNotifier {

  Status _status = Status.Uninitialized;
  Status get status => _status;

  CountryLookupResponse countryLookupResponse=CountryLookupResponse();
  CountryCodeLengthResponse countryCodeLengthResponse=CountryCodeLengthResponse();
  ErrorResponse errorResponse=ErrorResponse();

  Future<CountryLookupResponse> getcountry() async {
    await Rest().getcountry().then((value) {
      _status = Status.Authenticating;
      if (value.status == "success") {
        _status = Status.Authenticated;
        countryLookupResponse = value;
        notifyListeners();
      } else {
        _status = Status.Unauthenticated;
        countryLookupResponse = value;
        notifyListeners();
      }
    });
    return countryLookupResponse;
  }
  Future<CountryCodeLengthResponse> getcountrylength() async {
    await Rest().getcountrycodelength().then((value) {
      _status = Status.Authenticating;
      if (value.status == "success") {
        _status = Status.Authenticated;
        countryCodeLengthResponse = value;
        notifyListeners();
      } else {
        _status = Status.Unauthenticated;
        countryCodeLengthResponse = value;
        notifyListeners();
      }
    });
    return countryCodeLengthResponse;
  }
  Future<ErrorResponse> geterrorResponsedata() async {
    await Rest().geterrorresponsedata().then((value) {
      _status = Status.Authenticating;
        errorResponse = value;
        notifyListeners();
    });
    return errorResponse;
  }
}

