
import 'dart:convert';
import 'package:http/http.dart' as http;

const path = "https://yomomma-api.herokuapp.com/";

String query;
searchJoke(query) async {
  var searchURI = Uri.parse(path+"$query");
  final response = await http.get(searchURI);
  if (response.statusCode == 200) {
    var jsonData = json.decode(response.body); //key:value pair is got
    print('obtained response from search');
    print(jsonData['result']);
    return jsonData['result'];
    // Joke search = new Joke.fromJson(jsonData['result']); //mapped with model
    // print(search);
    // return search;
  }
  return Exception("Error searching your joke");

}

randomJoke() async {
  var randomURI = Uri.parse(path+"jokes");
  final response = await http.get(randomURI);
  if (response.statusCode == 200){
    var random = json.decode(response.body);
    print(random['joke']);
    print("getting random joke");
    return random['joke'];
    // Joke joke = Joke.fromRawJson(random);
    // // print(joke);
    // return joke;
  }
  return Exception("Error getting a random joke");
}

endPoint() async {
  final response = await http.get(Uri.parse(path));
  if(response.statusCode == 200){
    return "OK";
  }
  return Exception("NOT OK!");
}

