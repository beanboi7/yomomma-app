
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yomomma/main.dart';
import 'api.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  final _formkey = GlobalKey<FormState>();

  Future<QueryJokes> searchJokes;
  int page = 1;

  SearchPage search = SearchPage();
  Root main = Root();

  @override
  void initState(){
    super.initState();
  }

  @protected
  @mustCallSuper
  void didChangeDependencies(){
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: <Widget>[
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty){
                return 'Please enter a query';
              }
              return null;
            },
          ),
          ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                      (states) => RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )
              )
            ),
            onPressed: () async {
              if(_formkey.currentState.validate()){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Getting yomomma")));

              }

              },
            child: Text("Search"),
          ),
          FutureBuilder(
            future: ,
              builder: (context,snapshot){

          }),
        ],
      ),
    );
  }
}
