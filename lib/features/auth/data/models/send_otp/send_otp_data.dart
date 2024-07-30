class SendOtpData {
  final String email;

  SendOtpData({required this.email});

  factory SendOtpData.fromJson(Map<String, dynamic> json) {
    return SendOtpData(email: json["email"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
    };
  }
}
