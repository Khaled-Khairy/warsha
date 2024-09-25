import 'package:warsha/core/helpers/app_regex.dart';

class Validations {
  static String? userNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Username cannot be empty";
    }
    if (value.length <= 2) {
      return "Username must be at least 3 characters long";
    }
    if (value.length > 40) {
      return "Username cannot be more than 40 characters long";
    }
    if (!AppRegex.isUsernameValid(value)) {
      return "Please enter a valid username";
    }
    return null;
  }

  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty!';
    }
    if (!AppRegex.isEmailValid(value)) {
      return 'Please enter valid email';
    }
    return null;
  }

  static String? phoneNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone Number cannot be empty!';
    }
    if (!AppRegex.isPhoneNumberValid(value)) {
      return 'Please enter valid Phone Number';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty!';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 chars long!';
    }
    if (!AppRegex.hasUpperCase(value)) {
      return 'Password must include an uppercase letter!';
    }
    if (!AppRegex.hasLowerCase(value)) {
      return 'Password must include a lowercase letter!';
    }
    if (!AppRegex.hasNumber(value)) {
      return 'Password must include a number!';
    }
    return null;
  }
}
