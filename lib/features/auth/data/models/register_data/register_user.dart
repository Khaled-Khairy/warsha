class RegisterUser {
  final String username;
  final String email;
  final String phone;
  final String password;
  final String confirmPassword;

  RegisterUser({
    required this.username,
    required this.email,
    required this.phone,
    required this.password,
    required this.confirmPassword,
  });

  factory RegisterUser.fromJson(Map<String, dynamic> json) {
    return RegisterUser(
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      password: json['password'],
      confirmPassword: json['password2'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'phone': phone,
      'password': password,
      'password2': confirmPassword,
    };
  }
}
