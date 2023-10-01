class User {
  const User({
    required this.userId,
    required this.id,
    required this.title,
  });

  final int userId;
  final int id;
  final String title;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
