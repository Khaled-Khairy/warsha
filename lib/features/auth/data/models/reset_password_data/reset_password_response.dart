class ResetPasswordResponse {
  final String msg;

  ResetPasswordResponse({required this.msg});

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) {
    return ResetPasswordResponse(msg: json["msg"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "msg": msg,
    };
  }
}