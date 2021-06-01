import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'api.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    searchJoke(query);

    return SafeArea(
      child: AnimatedContainer(
        width: 40.0,
        height: 80.0,
        curve: Curves.easeInSine,
        decoration: BoxDecoration(
          color: Colors.pinkAccent[100],
          borderRadius: BorderRadius.circular(20.0),
        ),
        duration: Duration(seconds: 5),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CupertinoTextField(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 16.0
                ),
                placeholder: 'Enter some text',
                onSubmitted: (String value){
                  if (value == null || value.isEmpty){
                    return 'enter a valid keyword';
                  }
                  value = textController.text;
                  query = value;
                  return null;
                },


              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 16.0
                ),
                child: CupertinoButton(
                  child: Text('Search'),
                  color: Colors.pinkAccent[200],
                  borderRadius: BorderRadius.circular(20.0),
                  onPressed: (){
                    if(_formKey.currentState.validate()){
                      _showDialog();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showDialog(){
    showCupertinoDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: Text('Fetching'),
          content: Text("Searching for the joke"),
          actions: [
            CupertinoDialogAction(
              child: Text('OK'),
              onPressed: (){
                Navigator.pop(context, 'OK');
              },
            )
          ],
        )
    );
  }
}
