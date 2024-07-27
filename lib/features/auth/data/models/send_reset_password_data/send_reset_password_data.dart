class SendResetPasswordData {
  final String email;

  SendResetPasswordData({required this.email});

  factory SendResetPasswordData.fromJson(Map<String, dynamic> json) {
    return SendResetPasswordData(email: json["email"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
    };
  }
}
