
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';

import 'dart:convert';

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


