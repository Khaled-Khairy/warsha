class SendResetPasswordResponse {
  final String msg;

  SendResetPasswordResponse({required this.msg});

  factory SendResetPasswordResponse.fromJson(Map<String, dynamic> json) {
    return SendResetPasswordResponse(msg: json["msg"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "msg": msg,
    };
  }
}
