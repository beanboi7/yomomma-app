// import 'dart:html';

import 'api.dart';

import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main(){
  runApp(Root());
}

class Root extends StatefulWidget {
  const Root({Key key}) : super(key: key);

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {

  Future<RandomJokes> randomJoke;
  int page = 0;
  double _height = 300.0;
  double _width = 300.0;
  Color _color = Colors.brown[700];
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(10);

  @override
  void initState(){
    super.initState();
    randomJoke = fetchJoke();
  }

  @protected
  @mustCallSuper
  void didChangeDependencies(){
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("YOMOMMA"),
          centerTitle: true,
        ),
        body: (page == 0) ? Center(
          child: AnimatedContainer(
            height: _height,
            width: _width,
            decoration: BoxDecoration(
              borderRadius: _borderRadius,
              color: _color,
              boxShadow: [
                BoxShadow(
                  color: Colors.blueGrey[300],
                  blurRadius: 30.0,
                  spreadRadius: 5.0,
                  offset: Offset(20.0,20.0),
                ),
              ],
            ),
            child: Text("Container1"),
            duration: Duration(seconds: 3),
            curve: Curves.bounceIn,
          )
        ) : Center(
          child: AnimatedContainer(
            height: _height,
            width: _width,
            decoration: BoxDecoration(
              borderRadius: _borderRadius,
            ),
            child: Text("Container2"),
            duration: Duration(seconds: 3),
            curve: Curves.bounceOut,
          ),
        )
      ),
    );
  }
}
