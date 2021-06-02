

import 'package:dio/dio.dart';
import 'dart:convert';
import 'model.dart';

// const baseUrl = "https://yomomma-api.herokuapp.com/jokes";
// String query;
// class RandomJokesModel{
//   final String joke;
//   RandomJokesModel({@required this.joke});
//   factory RandomJokesModel.fromJson(Map<String, dynamic> json){
//     return RandomJokesModel(
//       joke: json['joke'],
//     );
//   }
// }
//
// class QueryJokesModel{
//   final String qJoke;
//   QueryJokesModel({@required this.qJoke});
//
//   factory QueryJokesModel.fromJson(Map<String, dynamic> json){
//     return QueryJokesModel(
//       qJoke: json['results']
//     );
//   }
// }
//
// Future<QueryJokesModel> searchJoke(query) async {
//   assert(query != null);
//   var dio = Dio();
//   final response = await dio.get("https://yomomma-api.herokuapp.com/search?query="+"$query");
//   print("mate it works!" + response.data['results']);
//
//   if(response.statusCode == 200){
//     print("GET: /search works");
//     return QueryJokesModel.fromJson(jsonDecode(response.data['results']));
//   } else if(response.statusCode == 200 && response.data == null){
//       print("GET: No results found for the given query");
//       return QueryJokesModel.fromJson(jsonDecode(response.data['results']));
//   } else {
//     throw Exception("Failed to get your query");
//   }
// }
//
// Future<RandomJokesModel> fetchJoke() async{
//   var dio = Dio();
//
//   final response = await dio.get(baseUrl);
//   if (response.statusCode == 200){
//     print("GET: /jokes works");
//     return RandomJokesModel.fromJson(jsonDecode(response.data['joke']));
//   } else {
//     throw Exception("Failed to load jokes");
//   }
// }
//

//

const path = "https://yomomma-api.herokuapp.com/";
String query;
searchJoke(query) async {
  assert(query != null || query != "");
  final response = await Dio().get(path+"query="+"$query");
  if (response.statusCode == 200) {
    var jsonData = json.decode(response.data['results']);
    print('obtained response from search');
    Joke search = new Joke.fromJson(jsonData);
    return search;
  }
  return Exception("Error searching your joke");

}

randomJoke() async {
  final response = await Dio().get(path+"jokes");
  if (response.statusCode == 200){
    var random = json.decode(response.data);
    print("getting random joke");
    Joke joke = new Joke.fromJson(random);
    return joke;
  }
  return Exception("Error getting a random joke");
}

endPoint() async {
  final response = await Dio().get(path);
  if(response.statusCode == 200){
    return "OK";
  }
  return Exception("NOT OK!");
}

