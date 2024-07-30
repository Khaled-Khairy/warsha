class SendOtpRequest {
  final String email;

  SendOtpRequest({required this.email});

  factory SendOtpRequest.fromJson(Map<String, dynamic> json) {
    return SendOtpRequest(email: json["email"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
    };
  }
}
