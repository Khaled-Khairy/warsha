class RegisterResponse {
  final Token token;
  final String msg;

  RegisterResponse({
    required this.token,
    required this.msg,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      token: Token.fromJson(json['tokens']),
      msg: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tokens': token.toJson(),
      'message': msg,
    };
  }
}

class Token {
  final String refresh;
  final String access;

  Token({
    required this.refresh,
    required this.access,
  });

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      refresh: json['refresh'],
      access: json['access'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'refresh': refresh,
      'access': access,
    };
  }
}
