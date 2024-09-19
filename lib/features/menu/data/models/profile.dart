class Profile {
  String email;
  String username;
  String description;
  String phone;
  int score;

  Profile({
    required this.email,
    required this.username,
    required this.description,
    required this.phone,
    required this.score,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      email: json['email'],
      username: json['username'],
      description: json['description'] ?? '',  // Handle null description
      phone: json['phone'],
      score: json['score'],
    );
  }
}
