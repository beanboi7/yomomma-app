import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return Center(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Spacer(),
            Expanded(
              flex:1,
              child: CupertinoTextField(
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
            ),
            Expanded(
              flex: 1,
              child: Container(
                  child: Center(
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
                ),
            ),
            Spacer(),
          ],
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
              isDefaultAction: true,
              onPressed: (){
                Navigator.pop(context);
              },
            )
          ],
        )
    );
  }
}
