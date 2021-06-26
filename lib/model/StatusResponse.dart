class StatusResponse {
  String status;
  String statusCode;
  String msg;

  StatusResponse({this.status, this.statusCode, this.msg});

  StatusResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['statusCode'] = this.statusCode;
    data['msg'] = this.msg;
    return data;
  }
}