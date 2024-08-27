class SignUpRequest {
  final String email;
  final String username;
  final String phone;
  final String password;
  final String confirmPassword;

  SignUpRequest({
    required this.email,
    required this.username,
    required this.phone,
    required this.password,
    required this.confirmPassword,
  });

  factory SignUpRequest.fromJson(Map<String, dynamic> json) {
    return SignUpRequest(
      email: json['email'],
      username: json['username'],
      phone: json['phone'],
      password: json['password'],
      confirmPassword: json['confirm_password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'username': username,
      'phone': phone,
      'password': password,
      'confirm_password': confirmPassword,
    };
  }
}
