class ValidateOtpRequest {
  final String email;
  final String otp;

  ValidateOtpRequest({
    required this.email,
    required this.otp,
  });

  factory ValidateOtpRequest.fromJson(Map<String, dynamic> json) {
    return ValidateOtpRequest(
      email: json['email'],
      otp: json['otp'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'otp': otp,
    };
  }
}
