class ApiEndpoints {
  static const String baseUrl = 'http://192.168.1.4:8000/api/';
  static const String login = 'user/login/';
  static const String signUp = 'user/signup/';
  static const String sendOtp = 'user/send-otp/';
  static const String validateOtp = 'user/validate-otp/';
  static const String resetPassword = 'user/reset-password/';
  static const String logOut = 'user/logout/';
  static const String allCourses = 'course/';
  static const String categories = 'categories/';
  static const String myCourses = 'my_courses';

  static String coursesByCategory(String category) {
    return 'categories/$category/courses/';
  }

  static String subscribeToCourse(String slug) {
    return 'courses/$slug/subscribe/';
  }
}
