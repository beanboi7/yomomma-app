import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'api.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Future<dynamic> queried;
  Future futureSearchObj;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureSearchObj = endPoint();
  }

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
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
                  queried = value as Future;
                  },
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: futureSearchObj,
                builder: (BuildContext context, snapshot){
                  if (snapshot.connectionState == ConnectionState.done){
                    return Container(
                      height: 250,
                      width: 300,
                      child: Column(
                        children: <Widget>[
                          Text(
                            '$queried',
                            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0),
                          ),
                        ],
                      ),
                    );
                  };
                  return loader();
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
                          queried = searchJoke(queried);
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

  loader() {
    return SpinKitCubeGrid(
      size: 25.0,
      color: Colors.blue[200],
    );
  }
}
