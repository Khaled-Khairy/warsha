// class LoginResponse {
//   final Token token;
//   final String msg;
//
//   LoginResponse({
//     required this.token,
//     required this.msg,
//   });
//
//   factory LoginResponse.fromJson(Map<String, dynamic> json) {
//     return LoginResponse(
//       token: Token.fromJson(json['token']),
//       msg: json['msg'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'token': token.toJson(),
//       'msg': msg,
//     };
//   }
// }
//
// class Token {
//   final String refresh;
//   final String access;
//
//   Token({
//     required this.refresh,
//     required this.access,
//   });
//
//   factory Token.fromJson(Map<String, dynamic> json) {
//     return Token(
//       refresh: json['refresh'],
//       access: json['access'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'refresh': refresh,
//       'access': access,
//     };
//   }
// }
class LoginResponse {
  final String token;

  LoginResponse({required this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json['token'] as String,
    );
  }
}
