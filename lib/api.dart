
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';

import 'dart:convert';

import 'package:flutter/material.dart';

//class for our api model
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
  final String qjoke;
  QueryJokes({@required this.qjoke});

  factory QueryJokes.fromJson(Map<String, dynamic> json){
    return QueryJokes(
      qjoke: json['results']
    );
  }
}

Future<RandomJokes> fetchJoke() async{
  var dio = Dio();
  final response = await dio.get("https://yomomma-api.herokuapp.com/jokes");
  // print("mate it works! " + response.data['joke']);
  if (response.statusCode == 200){
    print("GET: /jokes works");
    return RandomJokes.fromJson(jsonDecode(response.data['joke']));
  } else {
    throw Exception("Failed to load jokes");
  }
}

Future<QueryJokes> searchJoke() async {
  var dio = Dio();
  final response = await dio.get("htttps://yomomma-api.herokuapp.com/search");
  print("mate it works!" + response.data['results']);

  if(response.statusCode == 200){
    print("GET: /search works");
    return QueryJokes.fromJson(jsonDecode(response.data['results']));
  } else if(response.statusCode == 200 && response.data == null){
    print("GEt: No results found for the given query");
    return QueryJokes.fromJson(jsonDecode(response.data['results']));
  } else {
    throw Exception("Failed to get your query");
  }
}


