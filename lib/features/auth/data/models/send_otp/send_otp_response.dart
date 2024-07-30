class SendOtpResponse {
  final String message;

  SendOtpResponse({required this.message});

  factory SendOtpResponse.fromJson(Map<String, dynamic> json) {
    return SendOtpResponse(message: json["message"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "message": message,
    };
  }
}
