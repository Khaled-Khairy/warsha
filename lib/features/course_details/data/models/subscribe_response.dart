class SubscribeResponse {
  final int user;
  final int course;
  final String image;
  final String serialNumber;
  final bool confirmed;

  SubscribeResponse(
      {required this.user,
      required this.course,
      required this.image,
      required this.serialNumber,
      required this.confirmed});

  factory SubscribeResponse.fromJson(Map<String, dynamic> json) {
    return SubscribeResponse(
      user: json['user'],
      course: json['course'],
      image: json['image'],
      serialNumber: json['serial_number'],
      confirmed: json['confirmed'],
    );
  }
}
