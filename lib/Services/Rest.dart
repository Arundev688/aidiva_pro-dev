import 'dart:convert';
import 'dart:io';

import 'package:aidiva_pro/model/AppointmentModel/AppointmentResponse.dart';
import 'package:aidiva_pro/model/LoginwithMobileResponse.dart';
import 'package:aidiva_pro/model/Lookupmodel/CountryCodeLengthResponse.dart';
import 'package:aidiva_pro/model/Lookupmodel/CountryLookupResponse.dart';
import 'package:aidiva_pro/model/Lookupmodel/CurrentCountryResponse.dart';
import 'package:aidiva_pro/model/Lookupmodel/ErrorResponse.dart';
import 'package:aidiva_pro/model/Lookupmodel/LocaldbModel/ErrordataLocal.dart';
import 'package:aidiva_pro/model/RegisterResponse.dart';
import 'package:aidiva_pro/model/StatusResponse.dart';
import 'package:aidiva_pro/model/VerifyOtpResponse.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:http/io_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Rest {
  String BASEURL = "dev.rigelsoft.com:8443";


  String LOOKUP_BASEURL="dev.rigelsoft.com";

  StatusResponse statusResponse = StatusResponse();
  RegisterResponse registerResponse = RegisterResponse();
  VerifyOtpResponse verifyOtpResponse = VerifyOtpResponse();
  LoginwithMobileResponse loginwithMobileResponse = LoginwithMobileResponse();
CountryLookupResponse countryLookupResponse=CountryLookupResponse();
CurrentCountryResponse currentCountryResponse=CurrentCountryResponse();
CountryCodeLengthResponse countryCodeLengthResponse=CountryCodeLengthResponse();
AppointmentResoponse appointmentResoponse=AppointmentResoponse();
ErrorResponse errorResponse=ErrorResponse();
  @override
  Future<RegisterResponse> register(String countrycode,String mobileno,String email,String password) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"countryCode": "$countrycode","mobileNo": "$mobileno","userType": "TNT","email": "$email","password": "$password","isSignUp": true}';
    print("Requestbody: ${json}");
    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
    IOClient ioClient = new IOClient(httpClient);
    var response = await ioClient.post(
        Uri.https(BASEURL, "/services/users/auth/signup"),
        headers: {"Content-type": "application/json"},
        body: json);
    print("Response Body: ${response.body}");
//    Login albums = loginFromJson(response.body);
    registerResponse = RegisterResponse.fromJson(convert.jsonDecode(response.body));
    return registerResponse;
  }

  @override
  Future<VerifyOtpResponse> verifyotp(String otp,String uuid,String userType) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
    IOClient ioClient = new IOClient(httpClient);
    String json = '{"otpNumber": "$otp","userType": "$userType","uuid": "$uuid"}';
    print("Requestbody: ${json}");
    var response = await ioClient.post(
        Uri.https(BASEURL, "/services/users/auth/validateOTP"),
        headers: {"Content-type": "application/json"},
        body: json);
    print("Response Body: ${response.body}");
//    Login albums = loginFromJson(response.body);
    verifyOtpResponse = VerifyOtpResponse.fromJson(convert.jsonDecode(response.body));
    return verifyOtpResponse;
  }

  @override
  Future<RegisterResponse> loginwithmobile(String mobileno) async {
    Map<String, String> headers = {"Content-type": "application/json"};

    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
    IOClient ioClient = new IOClient(httpClient);

    String json = '{"userType": "TNT","mobileNo": "$mobileno"}';
    print("Requestbody: ${json}");
    var response = await ioClient.post(
        Uri.https(BASEURL, "/services/users/auth/sendOTP"),
        headers: {"Content-type": "application/json"},
        body: json);
    print("Response Body: ${response.body}");
//    Login albums = loginFromJson(response.body);
    registerResponse = RegisterResponse.fromJson(convert.jsonDecode(response.body));
    return registerResponse;
  }

  @override
  Future<LoginwithMobileResponse> getLogin(String username, String password) async {
    String json = '{"username":"$username","password":"$password","userType":"TNT","validationType":""}';

    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
    IOClient ioClient = new IOClient(httpClient);
    var response = await ioClient.post(Uri.https(BASEURL, "/services/users/auth/signin"),
        headers: {"Content-type": "application/json"},
        body: json);
    if (response.statusCode == 200) {
      loginwithMobileResponse = LoginwithMobileResponse.fromJson(convert.jsonDecode(response.body));
      return loginwithMobileResponse;
    }
  }

  @override
  Future<CountryLookupResponse> getcountry() async {
    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
    IOClient ioClient = new IOClient(httpClient);
    var response = await ioClient.get(Uri.https(LOOKUP_BASEURL, "/services/ms-communication/lookup/index/mastLookupType/ISD"),
        headers: {"Content-type": "application/json"});

    if (response.statusCode == 200) {
      countryLookupResponse = countryLookupResponseFromJson(response.body);
      return countryLookupResponse;
    }
  }
  @override
  Future<CurrentCountryResponse> getcurrentcountry() async {

    var response = await http.get(Uri.https("ipapi.co", "/json/"),
        headers: {"Content-type": "application/json"});

    if (response.statusCode == 200) {
      currentCountryResponse = currentCountryResponseFromJson(response.body);
      return currentCountryResponse;
    }
  }
  @override
  Future<CountryCodeLengthResponse> getcountrycodelength() async {
    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
    IOClient ioClient = new IOClient(httpClient);
    var response = await ioClient.get(Uri.https(LOOKUP_BASEURL, "/services/ms-communication/lookup/index/mastLookupType/PHN"),
        headers: {"Content-type": "application/json"});
    if (response.statusCode == 200) {
      countryCodeLengthResponse = countryCodeLengthResponseFromJson(response.body);
      return countryCodeLengthResponse;
    }
  }
  @override
  Future<List<Errordatalocal>> geterrorresponsedata() async {
    List<Errordatalocal>errordata=[];
    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
    IOClient ioClient = new IOClient(httpClient);
    var response = await ioClient.get(Uri.https(LOOKUP_BASEURL, "/services/i18n/data/i18n-en.json"),
        headers: {"Content-type": "application/json"});
    if (response.statusCode == 200) {
      errorResponse = errorResponseFromJson(response.body);
     // for(int i=0;i<response.body.length;i++)
     //   {
     //     errordata.add(response.body[i]);
     //   }
      Map<String, dynamic> decoded = json.decode(response.body);
     decoded.forEach((key, value) {

       print(key);
       print(value);
       Errordatalocal errordatalocal=new Errordatalocal(id:1,key: key,value: value);
       errordata.add(errordatalocal);
     });
      return errordata;
    }
  }
  @override
  Future<AppointmentResoponse> getappointments(String uuid,String token) async {


    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
    IOClient ioClient = new IOClient(httpClient);
    var response = await ioClient.get(Uri.https(BASEURL, "/services/ms-calendar-appointment/appointment/index/tentUserId/"+uuid),
        headers: {"Content-type": "application/json","Authorization":"Bearer $token"});
    print(response.headers['bearer']);
    print(response.body);
    print(response.body);
    if (response.statusCode == 200) {
      addStringToSF("bearertoken",response.headers['bearer']);
      appointmentResoponse = appointmentResoponseFromJson(response.body);
      return appointmentResoponse;
    }
  }
  addStringToSF(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }
}