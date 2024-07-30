class RegisterResponse {
  final Tokens tokens;
  final String message;

  RegisterResponse({
    required this.tokens,
    required this.message,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      tokens: Tokens.fromJson(json['tokens']),
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tokens': tokens.toJson(),
      'message': message,
    };
  }
}

class Tokens {
  final String refresh;
  final String access;

  Tokens({
    required this.refresh,
    required this.access,
  });

  factory Tokens.fromJson(Map<String, dynamic> json) {
    return Tokens(
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
