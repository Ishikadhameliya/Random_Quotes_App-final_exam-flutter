class Quotes {
  final String data;
  final String name;

  Quotes({
    required this.data,
    required this.name,
  });

  factory Quotes.fromRandom({required Map json}) {
    return Quotes(
      data: json["quote"],
      name: json["author"],
    );
  }
  factory Quotes.fromPatience({required Map json}) {
    return Quotes(
      data: json['quoteText'],
      name: json['quoteAuthor'],
    );
  }
  factory Quotes.fromEnterpreneur({required Map json}) {
    return Quotes(
      data: json['text'],
      name: json['from'],
    );
  }
}
