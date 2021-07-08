import 'package:aidiva_pro/Services/Rest.dart';
import 'package:aidiva_pro/model/Lookupmodel/CountryCodeLengthResponse.dart';
import 'package:aidiva_pro/model/Lookupmodel/CountryLookupResponse.dart';
import 'package:aidiva_pro/model/Lookupmodel/ErrorResponse.dart';
import 'package:aidiva_pro/model/Lookupmodel/LocaldbModel/Countrycode.dart';
import 'package:aidiva_pro/model/Lookupmodel/LocaldbModel/ErrordataLocal.dart';
import 'package:aidiva_pro/provider/Lookuplocaldb.dart';
import 'package:flutter/material.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class LookupProvider extends ChangeNotifier {
  Status _status = Status.Uninitialized;

  Status get status => _status;

  CountryLookupResponse countryLookupResponse = CountryLookupResponse();
  CountryCodeLengthResponse countryCodeLengthResponse =
      CountryCodeLengthResponse();
  ErrorResponse errorResponse = ErrorResponse();
  Future<CountryLookupResponse> getcountry() async {
    await Rest().getcountry().then((value) {
      _status = Status.Authenticating;
      if (value.status == "success") {
        _status = Status.Authenticated;
        countryLookupResponse = value;

        Lookuplocaldb.db.getAllCountry().then((value1) {
          if (value1.length == 0) {
            countryLookupResponse.data.forEach((val) {
              Lookuplocaldb.db.InsertCountry(
                  val.mastLookupKey, val.mastLookupValue, val.mastLookupType);
            });
          } else {
            print("Already inserted");
          }});
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

        Lookuplocaldb.db.getAllCountrycodedata().then((value1) {
          if (value1.length == 0) {
            countryCodeLengthResponse.data.forEach((val) {
              Lookuplocaldb.db.InsertCountryCodedata(
                  val.mastLookupKey, val.mastLookupValue, val.mastLookupType);
            });
          }else{
            print("Already inserted");
          }
        });
        notifyListeners();
      } else {
        _status = Status.Unauthenticated;
        countryCodeLengthResponse = value;
        notifyListeners();
      }
    });
    return countryCodeLengthResponse;
  }

  Future<List<Errordatalocal>> geterrorResponsedata() async {
    List<Errordatalocal> list = [];
    await Rest().geterrorresponsedata().then((value) {
      _status = Status.Authenticating;
      list = value;
      Lookuplocaldb.db.getErrordata().then((value1) {
        if (value1.length == 0) {



          // errorResponse.forEach((val) {
          //   Lookuplocaldb.db.InsertCountryCodedata(
          //       val.mastLookupKey, val.mastLookupValue, val.mastLookupType);
          // });
          for (int i = 0; i < value.length; i++) {
            Lookuplocaldb.db.InsertErrordata(value[i].id,value[i].key,value[i].value);
          }
        } else {
          print("already inserted");
        }
      });
      notifyListeners();
    });
    return list;
  }

  void getKeysFromMap(Map map) {
    print('----------');
    print('Get keys:');
    // Get all keys
    map.keys.forEach((key) {
      print(key);
    });
  }
}
