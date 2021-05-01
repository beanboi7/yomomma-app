import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:yomomma/api.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'account.dart';
import 'search.dart';

void main(){
  runApp(YoApp());
}


class YoApp extends StatefulWidget {
  const YoApp({Key  key}) : super(key: key);

  @override
  _YoAppState createState() => _YoAppState();
}

class _YoAppState extends State<YoApp> {
  Future<RandomJokes> futureJokes;
  int page = 1;

  SearchPage search = SearchPage();
  AccountPage account = AccountPage();

  @override
  void initState(){
    super.initState();
    futureJokes = fetchJoke();
  }

  @protected
  @mustCallSuper
  void didChangeDependencies(){
  }


  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Yomomma"),
          centerTitle: true,
        ),
        body:
        (page == 0) ? Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage('assets/images/katana.jpg'),
            ),
          ),
          child: Center(
            child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  blurRadius: 16,
                  spreadRadius: 16,
                  color: Colors.black.withOpacity(0.1),
                )
              ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 20.0,
                    sigmaY: 20.0,
                  ),
                  child: Container(
                      width: 360,
                      height: 200,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(
                            width: 1.5,
                            color: Colors.white.withOpacity(0.2),
                          )),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('ur mum', style: TextStyle(color: Colors.white.withOpacity(0.75))),
                                Icon(Icons.wb_incandescent, color: Colors.white.withOpacity(0.75),)
                              ],
                            ),
                            //Spacer(),
                            FutureBuilder(
                              future: futureJokes,
                              builder: (context, snapshot){
                                // ignore: missing_return
                                if (snapshot.connectionState == ConnectionState.done && snapshot.data != null){
                                  return Row(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Center(
                                          child: Center(
                                              child: Text(
                                                  snapshot.data,
                                                  style: TextStyle(
                                                      color: Colors.white.withOpacity(0.75),
                                                      fontSize: 14.0,
                                                      fontWeight: FontWeight.bold,
                                                  ),
                                              )
                                          ),
                                      ) ,
                                    ],
                                  );
                                } else if (snapshot.hasError){
                                    return Text("${snapshot.error}");
                                }
                                return CircularProgressIndicator();
                              }
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('YoMomma', style: TextStyle(color: Colors.white.withOpacity(0.75))),
                                Text('07/25', style: TextStyle(color: Colors.white.withOpacity(0.75))),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('5555 5555 5555 4444', style: TextStyle(color: Colors.white.withOpacity(0.75))),
                              ],
                            )
                          ],
                        ),
                      )
                  ),
                ),
              ),
            ),
          ),
        ) :
        (page == 1) ? search :
        (page ==2) ? account : Container(),
        bottomNavigationBar: CurvedNavigationBar(
          height: 50.0,
          index: 0,
          items: <Widget>[
            Icon(Icons.home, size: 30.0, color: Colors.white70),
            Icon(Icons.search_rounded, size: 30.0, color: Colors.white70),
            Icon(Icons.account_circle_rounded , size: 30.0, color: Colors.white70),
          ],
          color: Colors.blueGrey[800],
          buttonBackgroundColor: Colors.blueGrey[400],
          backgroundColor: Colors.blueGrey[900],
          onTap: (index){
            setState(() {
              page = index;
            });
          },
        ),
      ),
    );
  }
}
