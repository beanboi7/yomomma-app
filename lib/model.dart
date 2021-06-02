// To parse this JSON data, do
//
//     final joke = jokeFromJson(jsonString);
import 'dart:convert';

class Joke {
  Joke({
    this.result,
    this.joke,
  });

  String result;
  String joke;

  factory Joke.fromRawJson(String str) => Joke.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Joke.fromJson(Map<String, dynamic> json) => Joke(
    result: json["result"],
    joke: json["joke"],
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "joke": joke,
  };
}