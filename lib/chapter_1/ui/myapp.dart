import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'design.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.brown, accentColor: Colors.green),
        home: new Scaffold(
            appBar: AppBar(
              title: Text(
                "Lorem İpsum",
                style: TextStyle(color: Colors.white),
              ),
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                  debugPrint("FAB Tıklandı");
                },
                child: Icon(
                  CupertinoIcons.phone_solid,
                )),
            //floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,

            body: ButtonTurleri()));
  }
}
