class QUT {
  int? id;
  final String quote;
  final String name;

  QUT({
    this.id,
    required this.quote,
    required this.name,
  });

  factory QUT.fromMap(Map<String, dynamic> data) {
    return QUT(
      id: data['id'],
      quote: data['quote'],
      name: data['name'],
    );
  }
}
