import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yomomma/account.dart';
import 'package:yomomma/home.dart';
import 'package:yomomma/search.dart';

void main() {
  return runApp(Root());
}

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      home: Yo(),
    );
  }
}

class Yo extends StatefulWidget {
  @override
  _YoState createState() => _YoState();
}

class _YoState extends State<Yo> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: [
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.search),
          label: "Search",
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.zzz),
          label: "About",
        ),
      ]),
      tabBuilder: (context, index) {
        CupertinoTabView returnVal;
        switch (index) {
          case 0:
            returnVal = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(child: Home());
            });
            break;
          case 1:
            returnVal = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(child: Search());
            });
            break;
          case 2:
            returnVal = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(child: About());
            });
            break;
        }
        return returnVal;
      },
    );
  }
}
