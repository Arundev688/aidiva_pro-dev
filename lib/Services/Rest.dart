import 'package:aidiva_pro/model/LoginwithMobileResponse.dart';
import 'package:aidiva_pro/model/Lookupmodel/CountryCodeLengthResponse.dart';
import 'package:aidiva_pro/model/Lookupmodel/CountryLookupResponse.dart';
import 'package:aidiva_pro/model/Lookupmodel/CurrentCountryResponse.dart';
import 'package:aidiva_pro/model/Lookupmodel/ErrorResponse.dart';
import 'package:aidiva_pro/model/RegisterResponse.dart';
import 'package:aidiva_pro/model/StatusResponse.dart';
import 'package:aidiva_pro/model/VerifyOtpResponse.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Rest {
  String BASEURL = "dev.rigelsoft.com:8889";


  String LOOKUP_BASEURL="dev.rigelsoft.com";

  StatusResponse statusResponse = StatusResponse();
  RegisterResponse registerResponse = RegisterResponse();
  VerifyOtpResponse verifyOtpResponse = VerifyOtpResponse();
  LoginwithMobileResponse loginwithMobileResponse = LoginwithMobileResponse();
CountryLookupResponse countryLookupResponse=CountryLookupResponse();
CurrentCountryResponse currentCountryResponse=CurrentCountryResponse();
CountryCodeLengthResponse countryCodeLengthResponse=CountryCodeLengthResponse();
ErrorResponse errorResponse=ErrorResponse();
  @override
  Future<RegisterResponse> register(String countrycode,String mobileno,String email,String password) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"countryCode": "$countrycode","mobileNo": "$mobileno","userType": "TNT","email": "$email","password": "$password","isSignUp": true}';
    print("Requestbody: ${json}");
    var response = await http.post(
        Uri.http(BASEURL, "/services/users/auth/signup"),
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
    String json = '{"otpNumber": "$otp","userType": "$userType","uuid": "$uuid"}';
    print("Requestbody: ${json}");
    var response = await http.post(
        Uri.http(BASEURL, "/services/users/auth/validateOTP"),
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
    String json = '{"userType": "TNT","mobileNo": "$mobileno"}';
    print("Requestbody: ${json}");
    var response = await http.post(
        Uri.http(BASEURL, "/services/users/auth/sendOTP"),
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
    var response = await http.post(Uri.http(BASEURL, "/services/users/auth/signin"),
        headers: {"Content-type": "application/json"},
        body: json);
    if (response.statusCode == 200) {
      loginwithMobileResponse = LoginwithMobileResponse.fromJson(convert.jsonDecode(response.body));
      return loginwithMobileResponse;
    }
  }

  @override
  Future<CountryLookupResponse> getcountry() async {
    var response = await http.get(Uri.http(LOOKUP_BASEURL, "/services/ms-communication/lookup/index/mastLookupType/ISD"),
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
    var response = await http.get(Uri.http(LOOKUP_BASEURL, "/services/ms-communication/lookup/index/mastLookupType/PHN"),
        headers: {"Content-type": "application/json"});
    if (response.statusCode == 200) {
      countryCodeLengthResponse = countryCodeLengthResponseFromJson(response.body);
      return countryCodeLengthResponse;
    }
  }

  @override
  Future<ErrorResponse> geterrorresponsedata() async {
    var response = await http.get(Uri.http(LOOKUP_BASEURL, "/services/i18n/data/i18n-en.json"),
        headers: {"Content-type": "application/json"});
    if (response.statusCode == 200) {
      errorResponse = errorResponseFromJson(response.body);
      return errorResponse;
    }
  }
}