class ResetPasswordRequest {
  final String token;
  final String newPassword;
  final String confirmPassword;

  ResetPasswordRequest({
    required this.token,
    required this.newPassword,
    required this.confirmPassword,
  });

  factory ResetPasswordRequest.fromJson(Map<String, dynamic> json) {
    return ResetPasswordRequest(
      token: json['token'],
      newPassword: json['new_password'],
      confirmPassword: json['confirm_password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'new_password': newPassword,
      'confirm_password': confirmPassword,
    };
  }
}
