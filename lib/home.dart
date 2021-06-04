
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'api.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<dynamic> joke;
  Future futureObj;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureObj = endPoint();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Spacer(),
          Expanded(
            flex: 2,
            child: FutureBuilder(
                future: futureObj,
                builder: (BuildContext context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    // joke = snapshot.data;
                    return Container(
                      height: 250.0,
                      width: 300.0,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Text(
                              joke == null ? 'YO momma' : "$joke",
                              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0),
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    );
                  }
                  else {
                    return loader();
                  }
                }
            ),
          ),
          Spacer(),
          Expanded(
            flex: 1,
            child: Container(
              height: 25.0,
              width: 100.0,
              child: CupertinoButton(
                color: Colors.black,
                child: Center(
                  child: Icon(Icons.refresh),
                ),
                onPressed: () {
                  setState(() {
                    joke = randomJoke();
                  });
                },
              ),
            ),
          ),
          Spacer(),
        ],
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
