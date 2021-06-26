// To parse this JSON data, do
//
//     final errorResponse = errorResponseFromJson(jsonString);

import 'dart:convert';

ErrorResponse errorResponseFromJson(String str) => ErrorResponse.fromJson(json.decode(str));

String errorResponseToJson(ErrorResponse data) => json.encode(data.toJson());

class ErrorResponse {
  ErrorResponse({
    this.email,
    this.errWeek,
    this.errDay,
    this.errUuidAlreadyDeleted,
    this.errUuidCantUpdate,
    this.errBlogFaqUuidNotMatch,
    this.errMethod,
    this.errInvalidMethod,
    this.errMethodNotAllowed,
    this.errUnProcessible,
    this.errParams,
    this.errValidation,
    this.errUuidNotMatch,
    this.errDataNotFound,
    this.errDatabaseInsert,
    this.errDatabaseUpdate,
    this.passwordErr,
    this.invalidErr,
    this.invalidInputErr,
    this.emailTakenErr,
    this.sucDataFound,
    this.sucDataInsert,
    this.sucDataUpdated,
    this.sucDataDeleted,
    this.errDupComName,
    this.errRegularTime,
    this.errBlockTime,
    this.errExistAppointment,
    this.errTmplUuidNotMatch,
    this.errTmplNotFound,
    this.errCustNotFound,
    this.errTimeInvalid,
    this.errTentUserNotFound,
    this.errModeNotMatched,
    this.errBothUuidPassed,
    this.errThisFeatureNotAvailable,
    this.errFaqUuidNotMatch,
    this.errQuestionUuidNotMatch,
    this.errMailSubjectRequired,
    this.errArticleUuidNotMatch,
    this.errReminderUuidNotMatch,
    this.errPlanUuidNotMatch,
    this.errPlanreminderUuidNotMatch,
    this.errMastProductUuidNotMatch,
    this.errTentTypeUuidNotMatch,
    this.errTentUuidNotMatch,
    this.errTentgroupUuidNotMatch,
    this.errCategoryUuidNotMatch,
    this.errCatUuidNotMatch,
    this.errTentUserUuidNotMatch,
    this.errCustUuidNotMatch,
    this.errReminderSettingUuidNotMatch,
    this.remiderSettingNotFound,
    this.uri,
    this.url,
    this.words,
    this.alphanum,
    this.errorResponseInt,
    this.float,
    this.tel,
    this.text,
    this.file,
    this.folder,
    this.address,
    this.dateDmy,
    this.dateYmd,
    this.ipv6,
    this.ipv4,
    this.between,
    this.json,
    this.errLoginFailure,
    this.errPwdEmpty,
    this.errSignIn,
    this.errUserTypeEmpty,
    this.errUsernameEmpty,
    this.errUserType,
    this.errEmailTaken,
    this.errMobileEmailTaken,
    this.errSignUp,
    this.errMobileEmpty,
    this.errSendingOtp,
    this.errEmptyEmail,
    this.errNewPwd,
    this.errPwdMismatch,
    this.errChangePassword,
    this.errOtpEmpty,
    this.errValidationotpFailure,
    this.errSaveTenantMaster,
    this.errVerificationToken,
    this.errVerifyEmail,
    this.errSaveTenant,
    this.errEmailPhoneTaken,
    this.sucSaveTenant,
    this.errTentUuidNotPresent,
    this.errTentExerciseIdNotPresent,
    this.errDataNotFoundForUuid,
    this.errNoDataExist,
    this.errPlanDuplication,
    this.errNotifyTentEnabled,
  });

  String email;
  String errWeek;
  String errDay;
  String errUuidAlreadyDeleted;
  String errUuidCantUpdate;
  String errBlogFaqUuidNotMatch;
  String errMethod;
  String errInvalidMethod;
  String errMethodNotAllowed;
  String errUnProcessible;
  String errParams;
  String errValidation;
  String errUuidNotMatch;
  String errDataNotFound;
  String errDatabaseInsert;
  String errDatabaseUpdate;
  String passwordErr;
  String invalidErr;
  String invalidInputErr;
  String emailTakenErr;
  String sucDataFound;
  String sucDataInsert;
  String sucDataUpdated;
  String sucDataDeleted;
  String errDupComName;
  String errRegularTime;
  String errBlockTime;
  String errExistAppointment;
  String errTmplUuidNotMatch;
  String errTmplNotFound;
  String errCustNotFound;
  String errTimeInvalid;
  String errTentUserNotFound;
  String errModeNotMatched;
  String errBothUuidPassed;
  String errThisFeatureNotAvailable;
  String errFaqUuidNotMatch;
  String errQuestionUuidNotMatch;
  String errMailSubjectRequired;
  String errArticleUuidNotMatch;
  String errReminderUuidNotMatch;
  String errPlanUuidNotMatch;
  String errPlanreminderUuidNotMatch;
  String errMastProductUuidNotMatch;
  String errTentTypeUuidNotMatch;
  String errTentUuidNotMatch;
  String errTentgroupUuidNotMatch;
  String errCategoryUuidNotMatch;
  String errCatUuidNotMatch;
  String errTentUserUuidNotMatch;
  String errCustUuidNotMatch;
  String errReminderSettingUuidNotMatch;
  String remiderSettingNotFound;
  String uri;
  String url;
  String words;
  String alphanum;
  String errorResponseInt;
  String float;
  String tel;
  String text;
  String file;
  String folder;
  String address;
  String dateDmy;
  String dateYmd;
  String ipv6;
  String ipv4;
  String between;
  String json;
  String errLoginFailure;
  String errPwdEmpty;
  String errSignIn;
  String errUserTypeEmpty;
  String errUsernameEmpty;
  String errUserType;
  String errEmailTaken;
  String errMobileEmailTaken;
  String errSignUp;
  String errMobileEmpty;
  String errSendingOtp;
  String errEmptyEmail;
  String errNewPwd;
  String errPwdMismatch;
  String errChangePassword;
  String errOtpEmpty;
  String errValidationotpFailure;
  String errSaveTenantMaster;
  String errVerificationToken;
  String errVerifyEmail;
  String errSaveTenant;
  String errEmailPhoneTaken;
  String sucSaveTenant;
  String errTentUuidNotPresent;
  String errTentExerciseIdNotPresent;
  String errDataNotFoundForUuid;
  String errNoDataExist;
  String errPlanDuplication;
  String errNotifyTentEnabled;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
    email: json["email"] == null ? null : json["email"],
    errWeek: json["err_week"] == null ? null : json["err_week"],
    errDay: json["err_day"] == null ? null : json["err_day"],
    errUuidAlreadyDeleted: json["err_uuidAlreadyDeleted"] == null ? null : json["err_uuidAlreadyDeleted"],
    errUuidCantUpdate: json["err_uuid_cant_update"] == null ? null : json["err_uuid_cant_update"],
    errBlogFaqUuidNotMatch: json["err_blogFaqUUIDNotMatch"] == null ? null : json["err_blogFaqUUIDNotMatch"],
    errMethod: json["err_method"] == null ? null : json["err_method"],
    errInvalidMethod: json["err_invalid_method"] == null ? null : json["err_invalid_method"],
    errMethodNotAllowed: json["err_method_not_allowed"] == null ? null : json["err_method_not_allowed"],
    errUnProcessible: json["err_unProcessible"] == null ? null : json["err_unProcessible"],
    errParams: json["err_params"] == null ? null : json["err_params"],
    errValidation: json["err_validation"] == null ? null : json["err_validation"],
    errUuidNotMatch: json["err_uuidNotMatch"] == null ? null : json["err_uuidNotMatch"],
    errDataNotFound: json["err_dataNotFound"] == null ? null : json["err_dataNotFound"],
    errDatabaseInsert: json["err_databaseInsert"] == null ? null : json["err_databaseInsert"],
    errDatabaseUpdate: json["err_databaseUpdate"] == null ? null : json["err_databaseUpdate"],
    passwordErr: json["password_err"] == null ? null : json["password_err"],
    invalidErr: json["invalid_err"] == null ? null : json["invalid_err"],
    invalidInputErr: json["invalid_input_err"] == null ? null : json["invalid_input_err"],
    emailTakenErr: json["email_taken_err"] == null ? null : json["email_taken_err"],
    sucDataFound: json["suc_dataFound"] == null ? null : json["suc_dataFound"],
    sucDataInsert: json["suc_dataInsert"] == null ? null : json["suc_dataInsert"],
    sucDataUpdated: json["suc_dataUpdated"] == null ? null : json["suc_dataUpdated"],
    sucDataDeleted: json["suc_dataDeleted"] == null ? null : json["suc_dataDeleted"],
    errDupComName: json["err_dupComName"] == null ? null : json["err_dupComName"],
    errRegularTime: json["err_regularTime"] == null ? null : json["err_regularTime"],
    errBlockTime: json["err_blockTime"] == null ? null : json["err_blockTime"],
    errExistAppointment: json["err_existAppointment"] == null ? null : json["err_existAppointment"],
    errTmplUuidNotMatch: json["err_tmplUUIDNotMatch"] == null ? null : json["err_tmplUUIDNotMatch"],
    errTmplNotFound: json["err_TmplNotFound"] == null ? null : json["err_TmplNotFound"],
    errCustNotFound: json["err_CustNotFound"] == null ? null : json["err_CustNotFound"],
    errTimeInvalid: json["err_timeInvalid"] == null ? null : json["err_timeInvalid"],
    errTentUserNotFound: json["err_tentUserNotFound"] == null ? null : json["err_tentUserNotFound"],
    errModeNotMatched: json["err_ModeNotMatched"] == null ? null : json["err_ModeNotMatched"],
    errBothUuidPassed: json["err_BothUuidPassed"] == null ? null : json["err_BothUuidPassed"],
    errThisFeatureNotAvailable: json["err_thisFeatureNotAvailable"] == null ? null : json["err_thisFeatureNotAvailable"],
    errFaqUuidNotMatch: json["err_FaqUUIDNotMatch"] == null ? null : json["err_FaqUUIDNotMatch"],
    errQuestionUuidNotMatch: json["err_questionUUIDNotMatch"] == null ? null : json["err_questionUUIDNotMatch"],
    errMailSubjectRequired: json["err_mailSubjectRequired"] == null ? null : json["err_mailSubjectRequired"],
    errArticleUuidNotMatch: json["err_articleUUIDNotMatch"] == null ? null : json["err_articleUUIDNotMatch"],
    errReminderUuidNotMatch: json["err_reminderUUIDNotMatch"] == null ? null : json["err_reminderUUIDNotMatch"],
    errPlanUuidNotMatch: json["err_planUUIDNotMatch"] == null ? null : json["err_planUUIDNotMatch"],
    errPlanreminderUuidNotMatch: json["err_planreminderUUIDNotMatch"] == null ? null : json["err_planreminderUUIDNotMatch"],
    errMastProductUuidNotMatch: json["err_mastProductUUIDNotMatch"] == null ? null : json["err_mastProductUUIDNotMatch"],
    errTentTypeUuidNotMatch: json["err_tentTypeUUIDNotMatch"] == null ? null : json["err_tentTypeUUIDNotMatch"],
    errTentUuidNotMatch: json["err_tentUUIDNotMatch"] == null ? null : json["err_tentUUIDNotMatch"],
    errTentgroupUuidNotMatch: json["err_tentgroupUUIDNotMatch"] == null ? null : json["err_tentgroupUUIDNotMatch"],
    errCategoryUuidNotMatch: json["err_categoryUUIDNotMatch"] == null ? null : json["err_categoryUUIDNotMatch"],
    errCatUuidNotMatch: json["err_catUUIDNotMatch"] == null ? null : json["err_catUUIDNotMatch"],
    errTentUserUuidNotMatch: json["err_tentUserUUIDNotMatch"] == null ? null : json["err_tentUserUUIDNotMatch"],
    errCustUuidNotMatch: json["err_custUUIDNotMatch"] == null ? null : json["err_custUUIDNotMatch"],
    errReminderSettingUuidNotMatch: json["err_reminderSettingUUIDNotMatch"] == null ? null : json["err_reminderSettingUUIDNotMatch"],
    remiderSettingNotFound: json["remiderSettingNotFound"] == null ? null : json["remiderSettingNotFound"],
    uri: json["uri"] == null ? null : json["uri"],
    url: json["url"] == null ? null : json["url"],
    words: json["words"] == null ? null : json["words"],
    alphanum: json["alphanum"] == null ? null : json["alphanum"],
    errorResponseInt: json["int"] == null ? null : json["int"],
    float: json["float"] == null ? null : json["float"],
    tel: json["tel"] == null ? null : json["tel"],
    text: json["text"] == null ? null : json["text"],
    file: json["file"] == null ? null : json["file"],
    folder: json["folder"] == null ? null : json["folder"],
    address: json["address"] == null ? null : json["address"],
    dateDmy: json["date_dmy"] == null ? null : json["date_dmy"],
    dateYmd: json["date_ymd"] == null ? null : json["date_ymd"],
    ipv6: json["ipv6"] == null ? null : json["ipv6"],
    ipv4: json["ipv4"] == null ? null : json["ipv4"],
    between: json["between"] == null ? null : json["between"],
    json: json["json"] == null ? null : json["json"],
    errLoginFailure: json["err_loginFailure"] == null ? null : json["err_loginFailure"],
    errPwdEmpty: json["err_pwdEmpty"] == null ? null : json["err_pwdEmpty"],
    errSignIn: json["err_signIN"] == null ? null : json["err_signIN"],
    errUserTypeEmpty: json["err_userTypeEmpty"] == null ? null : json["err_userTypeEmpty"],
    errUsernameEmpty: json["err_usernameEmpty"] == null ? null : json["err_usernameEmpty"],
    errUserType: json["err_userType"] == null ? null : json["err_userType"],
    errEmailTaken: json["err_emailTaken"] == null ? null : json["err_emailTaken"],
    errMobileEmailTaken: json["err_mobileEmailTaken"] == null ? null : json["err_mobileEmailTaken"],
    errSignUp: json["err_signUp"] == null ? null : json["err_signUp"],
    errMobileEmpty: json["err_mobileEmpty"] == null ? null : json["err_mobileEmpty"],
    errSendingOtp: json["err_sendingOTP"] == null ? null : json["err_sendingOTP"],
    errEmptyEmail: json["err_emptyEmail"] == null ? null : json["err_emptyEmail"],
    errNewPwd: json["err_newPwd"] == null ? null : json["err_newPwd"],
    errPwdMismatch: json["err_pwdMismatch"] == null ? null : json["err_pwdMismatch"],
    errChangePassword: json["err_changePassword"] == null ? null : json["err_changePassword"],
    errOtpEmpty: json["err_OTPEmpty"] == null ? null : json["err_OTPEmpty"],
    errValidationotpFailure: json["err_validationotpFailure"] == null ? null : json["err_validationotpFailure"],
    errSaveTenantMaster: json["err_saveTenantMaster"] == null ? null : json["err_saveTenantMaster"],
    errVerificationToken: json["err_verificationToken"] == null ? null : json["err_verificationToken"],
    errVerifyEmail: json["err_verifyEmail"] == null ? null : json["err_verifyEmail"],
    errSaveTenant: json["err_saveTenant"] == null ? null : json["err_saveTenant"],
    errEmailPhoneTaken: json["err_emailPhoneTaken"] == null ? null : json["err_emailPhoneTaken"],
    sucSaveTenant: json["suc_saveTenant"] == null ? null : json["suc_saveTenant"],
    errTentUuidNotPresent: json["err_tentUuidNotPresent"] == null ? null : json["err_tentUuidNotPresent"],
    errTentExerciseIdNotPresent: json["err_tentExerciseIdNotPresent"] == null ? null : json["err_tentExerciseIdNotPresent"],
    errDataNotFoundForUuid: json["err_dataNotFoundForUuid"] == null ? null : json["err_dataNotFoundForUuid"],
    errNoDataExist: json["err_noDataExist"] == null ? null : json["err_noDataExist"],
    errPlanDuplication: json["err_planDuplication"] == null ? null : json["err_planDuplication"],
    errNotifyTentEnabled: json["err_notifyTentEnabled"] == null ? null : json["err_notifyTentEnabled"],
  );

  Map<String, dynamic> toJson() => {
    "email": email == null ? null : email,
    "err_week": errWeek == null ? null : errWeek,
    "err_day": errDay == null ? null : errDay,
    "err_uuidAlreadyDeleted": errUuidAlreadyDeleted == null ? null : errUuidAlreadyDeleted,
    "err_uuid_cant_update": errUuidCantUpdate == null ? null : errUuidCantUpdate,
    "err_blogFaqUUIDNotMatch": errBlogFaqUuidNotMatch == null ? null : errBlogFaqUuidNotMatch,
    "err_method": errMethod == null ? null : errMethod,
    "err_invalid_method": errInvalidMethod == null ? null : errInvalidMethod,
    "err_method_not_allowed": errMethodNotAllowed == null ? null : errMethodNotAllowed,
    "err_unProcessible": errUnProcessible == null ? null : errUnProcessible,
    "err_params": errParams == null ? null : errParams,
    "err_validation": errValidation == null ? null : errValidation,
    "err_uuidNotMatch": errUuidNotMatch == null ? null : errUuidNotMatch,
    "err_dataNotFound": errDataNotFound == null ? null : errDataNotFound,
    "err_databaseInsert": errDatabaseInsert == null ? null : errDatabaseInsert,
    "err_databaseUpdate": errDatabaseUpdate == null ? null : errDatabaseUpdate,
    "password_err": passwordErr == null ? null : passwordErr,
    "invalid_err": invalidErr == null ? null : invalidErr,
    "invalid_input_err": invalidInputErr == null ? null : invalidInputErr,
    "email_taken_err": emailTakenErr == null ? null : emailTakenErr,
    "suc_dataFound": sucDataFound == null ? null : sucDataFound,
    "suc_dataInsert": sucDataInsert == null ? null : sucDataInsert,
    "suc_dataUpdated": sucDataUpdated == null ? null : sucDataUpdated,
    "suc_dataDeleted": sucDataDeleted == null ? null : sucDataDeleted,
    "err_dupComName": errDupComName == null ? null : errDupComName,
    "err_regularTime": errRegularTime == null ? null : errRegularTime,
    "err_blockTime": errBlockTime == null ? null : errBlockTime,
    "err_existAppointment": errExistAppointment == null ? null : errExistAppointment,
    "err_tmplUUIDNotMatch": errTmplUuidNotMatch == null ? null : errTmplUuidNotMatch,
    "err_TmplNotFound": errTmplNotFound == null ? null : errTmplNotFound,
    "err_CustNotFound": errCustNotFound == null ? null : errCustNotFound,
    "err_timeInvalid": errTimeInvalid == null ? null : errTimeInvalid,
    "err_tentUserNotFound": errTentUserNotFound == null ? null : errTentUserNotFound,
    "err_ModeNotMatched": errModeNotMatched == null ? null : errModeNotMatched,
    "err_BothUuidPassed": errBothUuidPassed == null ? null : errBothUuidPassed,
    "err_thisFeatureNotAvailable": errThisFeatureNotAvailable == null ? null : errThisFeatureNotAvailable,
    "err_FaqUUIDNotMatch": errFaqUuidNotMatch == null ? null : errFaqUuidNotMatch,
    "err_questionUUIDNotMatch": errQuestionUuidNotMatch == null ? null : errQuestionUuidNotMatch,
    "err_mailSubjectRequired": errMailSubjectRequired == null ? null : errMailSubjectRequired,
    "err_articleUUIDNotMatch": errArticleUuidNotMatch == null ? null : errArticleUuidNotMatch,
    "err_reminderUUIDNotMatch": errReminderUuidNotMatch == null ? null : errReminderUuidNotMatch,
    "err_planUUIDNotMatch": errPlanUuidNotMatch == null ? null : errPlanUuidNotMatch,
    "err_planreminderUUIDNotMatch": errPlanreminderUuidNotMatch == null ? null : errPlanreminderUuidNotMatch,
    "err_mastProductUUIDNotMatch": errMastProductUuidNotMatch == null ? null : errMastProductUuidNotMatch,
    "err_tentTypeUUIDNotMatch": errTentTypeUuidNotMatch == null ? null : errTentTypeUuidNotMatch,
    "err_tentUUIDNotMatch": errTentUuidNotMatch == null ? null : errTentUuidNotMatch,
    "err_tentgroupUUIDNotMatch": errTentgroupUuidNotMatch == null ? null : errTentgroupUuidNotMatch,
    "err_categoryUUIDNotMatch": errCategoryUuidNotMatch == null ? null : errCategoryUuidNotMatch,
    "err_catUUIDNotMatch": errCatUuidNotMatch == null ? null : errCatUuidNotMatch,
    "err_tentUserUUIDNotMatch": errTentUserUuidNotMatch == null ? null : errTentUserUuidNotMatch,
    "err_custUUIDNotMatch": errCustUuidNotMatch == null ? null : errCustUuidNotMatch,
    "err_reminderSettingUUIDNotMatch": errReminderSettingUuidNotMatch == null ? null : errReminderSettingUuidNotMatch,
    "remiderSettingNotFound": remiderSettingNotFound == null ? null : remiderSettingNotFound,
    "uri": uri == null ? null : uri,
    "url": url == null ? null : url,
    "words": words == null ? null : words,
    "alphanum": alphanum == null ? null : alphanum,
    "int": errorResponseInt == null ? null : errorResponseInt,
    "float": float == null ? null : float,
    "tel": tel == null ? null : tel,
    "text": text == null ? null : text,
    "file": file == null ? null : file,
    "folder": folder == null ? null : folder,
    "address": address == null ? null : address,
    "date_dmy": dateDmy == null ? null : dateDmy,
    "date_ymd": dateYmd == null ? null : dateYmd,
    "ipv6": ipv6 == null ? null : ipv6,
    "ipv4": ipv4 == null ? null : ipv4,
    "between": between == null ? null : between,
    "json": json == null ? null : json,
    "err_loginFailure": errLoginFailure == null ? null : errLoginFailure,
    "err_pwdEmpty": errPwdEmpty == null ? null : errPwdEmpty,
    "err_signIN": errSignIn == null ? null : errSignIn,
    "err_userTypeEmpty": errUserTypeEmpty == null ? null : errUserTypeEmpty,
    "err_usernameEmpty": errUsernameEmpty == null ? null : errUsernameEmpty,
    "err_userType": errUserType == null ? null : errUserType,
    "err_emailTaken": errEmailTaken == null ? null : errEmailTaken,
    "err_mobileEmailTaken": errMobileEmailTaken == null ? null : errMobileEmailTaken,
    "err_signUp": errSignUp == null ? null : errSignUp,
    "err_mobileEmpty": errMobileEmpty == null ? null : errMobileEmpty,
    "err_sendingOTP": errSendingOtp == null ? null : errSendingOtp,
    "err_emptyEmail": errEmptyEmail == null ? null : errEmptyEmail,
    "err_newPwd": errNewPwd == null ? null : errNewPwd,
    "err_pwdMismatch": errPwdMismatch == null ? null : errPwdMismatch,
    "err_changePassword": errChangePassword == null ? null : errChangePassword,
    "err_OTPEmpty": errOtpEmpty == null ? null : errOtpEmpty,
    "err_validationotpFailure": errValidationotpFailure == null ? null : errValidationotpFailure,
    "err_saveTenantMaster": errSaveTenantMaster == null ? null : errSaveTenantMaster,
    "err_verificationToken": errVerificationToken == null ? null : errVerificationToken,
    "err_verifyEmail": errVerifyEmail == null ? null : errVerifyEmail,
    "err_saveTenant": errSaveTenant == null ? null : errSaveTenant,
    "err_emailPhoneTaken": errEmailPhoneTaken == null ? null : errEmailPhoneTaken,
    "suc_saveTenant": sucSaveTenant == null ? null : sucSaveTenant,
    "err_tentUuidNotPresent": errTentUuidNotPresent == null ? null : errTentUuidNotPresent,
    "err_tentExerciseIdNotPresent": errTentExerciseIdNotPresent == null ? null : errTentExerciseIdNotPresent,
    "err_dataNotFoundForUuid": errDataNotFoundForUuid == null ? null : errDataNotFoundForUuid,
    "err_noDataExist": errNoDataExist == null ? null : errNoDataExist,
    "err_planDuplication": errPlanDuplication == null ? null : errPlanDuplication,
    "err_notifyTentEnabled": errNotifyTentEnabled == null ? null : errNotifyTentEnabled,
  };
}
