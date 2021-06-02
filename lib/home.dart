
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:yomomma/model.dart';
import 'api.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String joke = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
          future: randomJoke(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              joke = snapshot.data;
              return Container(
                height: 100.0,
                width: 100.0,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Text(
                        '$joke',
                        style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0),
                      ),
                    ),
                    Spacer(),
                    Expanded(
                      flex: 1,
                      child: CupertinoButton(
                        color: Colors.black,
                        child: Center(
                          child: Icon(Icons.refresh),
                          heightFactor: 40.0,
                        ),
                        onPressed: () {
                          setState(() {
                            joke = randomJoke();
                          });
                        },
                      ),
                    )
                  ],
                ),
              );
            }
            else {
              return loader();
            }
          }
      ),
    );
  }

  loader() {
    return SpinKitCubeGrid(
      size: 25.0,
      color: Colors.blue[200],
    );
  }
}
