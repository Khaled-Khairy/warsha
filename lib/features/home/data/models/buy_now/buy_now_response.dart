class BuyNowResponse {
  final int user;
  final int course;
  final String image;
  final String serialNumber;
  final String state;
  final String reason;

  BuyNowResponse({
    required this.user,
    required this.course,
    required this.image,
    required this.serialNumber,
    required this.state,
    required this.reason,
  });

  factory BuyNowResponse.fromJson(Map<String, dynamic> json) {
    return BuyNowResponse(
      user: json['user'],
      course: json['course'],
      image: json['image'],
      serialNumber: json['serial_number'],
      state: json['state'],
      reason: json['reason'],
    );
  }
}
