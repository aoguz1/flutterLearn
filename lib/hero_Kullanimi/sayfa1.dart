import 'package:flutter/material.dart';
import 'package:listeler2/hero_Kullanimi/sayfa2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Sayfa1(),
    );
  }
}

class Sayfa1 extends StatefulWidget {
  Sayfa1({Key key}) : super(key: key);

  @override
  _Sayfa1State createState() => _Sayfa1State();
}

class _Sayfa1State extends State<Sayfa1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sayfa1"),
      ),
      body: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Sayfa2()),
          );
        },
        child: Hero(
            tag: "hero-example",
            child: Icon(
              Icons.thumb_up,
              size: 64,
              color: Colors.green,
            )),
      ),
    );
  }
}
