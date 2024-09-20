class ChangePasswordRequest {
  final String currentPassword;
  final String newPassword;
  final String repeatPassword;

  ChangePasswordRequest(
      {required this.currentPassword,
      required this.newPassword,
      required this.repeatPassword});

  Map<String, dynamic> toJson() {
    return {
      'current_password': currentPassword,
      'new_password': newPassword,
      'repeat_password': repeatPassword
    };
  }
}
