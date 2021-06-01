
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';

import 'dart:convert';

import 'package:flutter/material.dart';

const baseUrl = "https://yomomma-api.herokuapp.com/jokes";
String query;
class RandomJokesModel{
  final String joke;
  RandomJokesModel({@required this.joke});
  factory RandomJokesModel.fromJson(Map<String, dynamic> json){
    return RandomJokesModel(
      joke: json['joke'],
    );
  }
}

class QueryJokesModel{
  final String qJoke;
  QueryJokesModel({@required this.qJoke});

  factory QueryJokesModel.fromJson(Map<String, dynamic> json){
    return QueryJokesModel(
      qJoke: json['results']
    );
  }
}

Future<QueryJokesModel> searchJoke(query) async {
  assert(query != null);
  var dio = Dio();
  final response = await dio.get("https://yomomma-api.herokuapp.com/search?query="+"$query");
  print("mate it works!" + response.data['results']);

  if(response.statusCode == 200){
    print("GET: /search works");
    return QueryJokesModel.fromJson(jsonDecode(response.data['results']));
  } else if(response.statusCode == 200 && response.data == null){
      print("GET: No results found for the given query");
      return QueryJokesModel.fromJson(jsonDecode(response.data['results']));
  } else {
    throw Exception("Failed to get your query");
  }
}

Future<RandomJokesModel> fetchJoke() async{
  var dio = Dio();

  final response = await dio.get(baseUrl);
  // print("mate it works! " + response.data['joke']);
  if (response.statusCode == 200){
    print("GET: /jokes works");
    return RandomJokesModel.fromJson(jsonDecode(response.data['joke']));
  } else {
    throw Exception("Failed to load jokes");
  }
}




