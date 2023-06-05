import 'dart:convert';

JokeModel jokeModelFromJson(String str) => JokeModel.fromJson(json.decode(str));

String jokeModelToJson(JokeModel data) => json.encode(data.toJson());

class JokeModel {
  JokeModel({
    required this.categories,
    required this.created_at,
    required this.id,
    required this.updated_at,
    required this.url,
    required this.value,
  });

  List<dynamic> categories;
  DateTime created_at;
  String id;
  DateTime updated_at;
  String url;
  String value;

  factory JokeModel.fromJson(Map<String, dynamic> json) => JokeModel(
        categories: List<dynamic>.from(json["categories"].map((e) => e)),
        created_at: DateTime.parse(json["created_at"]),
        id: json["id"],
        updated_at: DateTime.parse(json["updated_at"]),
        url: json["url"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((e) => e)),
        "created_at": created_at.toIso8601String(),
        "id": id,
        "updated_at": updated_at.toIso8601String(),
        "url": url,
        "value": value,
      };
}
