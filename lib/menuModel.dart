// To parse this JSON data, do
//
//     final GamesModel = gameModelFromJson(jsonString);

import 'dart:convert';

GamesModel gameModelFromJson(String str) =>
    GamesModel.fromJson(json.decode(str));

String gameModelToJson(GamesModel data) => json.encode(data.toJson());

class GamesModel {
  GamesModel({
    required this.games,
  });

  List<Games> games = [];

  factory GamesModel.fromJson(Map<String, dynamic> json) => GamesModel(
        games: List<Games>.from(json["games"].map((x) => Games.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "games": List<dynamic>.from(games.map((x) => x.toJson())),
      };
}

class Games {
  Games({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.short_description,
    required this.game_url,
    required this.genre,
    required this.platform,
    required this.publisher,
    required this.release_date,
  });

  int id;
  String title;
  String thumbnail;
  String short_description;
  String game_url;
  String genre;
  String platform;
  String publisher;
  String release_date;

  factory Games.fromJson(Map<String, dynamic> json) => Games(
      id: json["id"],
      title: json["title"],
      thumbnail: json["thumbnail"],
      short_description: json["short_description"],
      game_url: json["game_url"],
      genre: json["genre"],
      platform: json["platform"],
      publisher: json["publisher"],
      release_date: json['release_date']);

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "thumbnail": thumbnail,
        "short_description": short_description,
        "game_url": game_url,
        "genre": genre,
        "platform": platform,
        "publisher": publisher,
        "release_date": release_date,
      };
}
