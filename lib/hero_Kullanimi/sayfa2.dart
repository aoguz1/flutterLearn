import 'package:flutter/material.dart';

class Sayfa2 extends StatefulWidget {
  @override
  _Sayfa2State createState() => _Sayfa2State();
}

class _Sayfa2State extends State<Sayfa2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sayfa2"),
      ),
      body: Center(
        child: InkWell(
          onTap: () {
              Navigator.pop(context);
          },
          child: Hero(
              tag: "hero-example",
              child: Icon(
                Icons.thumb_down,
                size: 64,
                color: Colors.red,
              )),
        ),
      ),
    );
  }
}
