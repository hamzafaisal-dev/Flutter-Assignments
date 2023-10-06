class Cards {
  const Cards({required this.title, required this.id});

  final String title;
  final int id;

  factory Cards.fromJson(Map<String, dynamic> json) {
    return Cards(
      id: json['id'],
      title: json['title'],
    );
  }
}
