import 'dart:ui';

import 'package:flutter/material.dart';
void main(){
  runApp(YoApp());
}


class YoApp extends StatefulWidget {
  const YoApp({Key  key}) : super(key: key);

  @override
  _YoAppState createState() => _YoAppState();
}

class _YoAppState extends State<YoApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
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
                                Text('Card', style: TextStyle(color: Colors.white.withOpacity(0.75))),
                                Icon(Icons.credit_card_sharp, color: Colors.white.withOpacity(0.75),)
                              ],
                            ),
                            Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('TL Templates', style: TextStyle(color: Colors.white.withOpacity(0.75))),
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
        ),
      ),
    );
  }
}
