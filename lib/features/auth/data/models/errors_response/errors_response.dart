class ErrorResponse {
  final Map<String, List<String>> errors;

  ErrorResponse({required this.errors});

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    final errors = <String, List<String>>{};
    json['errors'].forEach((key, value) {
      errors[key] = List<String>.from(value);
    });
    return ErrorResponse(errors: errors);
  }

  String getErrorMessages() {
    return errors.values.expand((messages) => messages).join(', ');
  }
}
