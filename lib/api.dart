
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';

import 'dart:convert';

import 'package:flutter/material.dart';

const baseUrl = "https://yomomma-api.herokuapp.com/jokes";
String query;
class RandomJokes{
  final String joke;
  RandomJokes({@required this.joke});
  factory RandomJokes.fromJson(Map<String, dynamic> json){
    return RandomJokes(
      joke: json['joke'],
    );
  }
}

class QueryJokes{
  final String qJoke;
  QueryJokes({@required this.qJoke});

  factory QueryJokes.fromJson(Map<String, dynamic> json){
    return QueryJokes(
      qJoke: json['results']
    );
  }
}

Future<QueryJokes> searchJoke(query) async {
  assert(query != null);
  var dio = Dio();
  final response = await dio.get("https://yomomma-api.herokuapp.com/search?query="+"$query");
  print("mate it works!" + response.data['results']);

  if(response.statusCode == 200){
    print("GET: /search works");
    return QueryJokes.fromJson(jsonDecode(response.data['results']));
  } else if(response.statusCode == 200 && response.data == null){
      print("GET: No results found for the given query");
      return QueryJokes.fromJson(jsonDecode(response.data['results']));
  } else {
    throw Exception("Failed to get your query");
  }
}

Future<RandomJokes> fetchJoke() async{
  var dio = Dio();

  final response = await dio.get(baseUrl);
  // print("mate it works! " + response.data['joke']);
  if (response.statusCode == 200){
    print("GET: /jokes works");
    return RandomJokes.fromJson(jsonDecode(response.data['joke']));
  } else {
    throw Exception("Failed to load jokes");
  }
}




