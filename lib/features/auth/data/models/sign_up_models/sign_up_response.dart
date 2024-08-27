class SignUpResponse {
  final Tokens tokens;
  final String message;

  SignUpResponse({
    required this.tokens,
    required this.message,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) {
    return SignUpResponse(
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
