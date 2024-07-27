class ResetPasswordData {
  final String otp;
  final String newPassword;
  final String confirmPassword;

  ResetPasswordData({
    required this.otp,
    required this.newPassword,
    required this.confirmPassword,
  });

  factory ResetPasswordData.fromJson(Map<String, dynamic> json) {
    return ResetPasswordData(
      otp: json['otp'],
      newPassword: json['new_password'],
      confirmPassword: json['confirm_password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'otp': otp,
      'new_password': newPassword,
      'confirm_password': confirmPassword,
    };
  }
}
