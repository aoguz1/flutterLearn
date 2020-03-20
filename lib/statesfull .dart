import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      
      theme: ThemeData(
        textTheme: TextTheme(display2:TextStyle(fontSize: 12.0) ) ,
        primaryColor: Colors.blue,
      ),
      title: "Material App",
      home: MyHomePage(title: "My Home Page"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  int sayac = 0;
  String title;

  MyHomePage({this.title}) {
    debugPrint("my home page statefull create consructors");
  }

  @override
  State<StatefulWidget> createState() {
    debugPrint("create state tetiklendi");
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  MyHomePageState() {
    debugPrint("MyHomePageState consructos");
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("my home page state build metodu tetiklendi ");
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("setstate tetiklendi");
          sayacDegeriniArttir();
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Sayı arttır"),
              color: Colors.green,
              textColor: Colors.white,
              onPressed: () {
                sayacDegeriniArttir();
              },
            ),
            Text("${widget.sayac}", style: 
            Theme.of(context).textTheme.display2.copyWith(
              color: widget.sayac  <= 0 ? Colors.red : Colors.green, 
            ),
            ),
            RaisedButton(
              child: Text("Sayı azalt"),
              color: Colors.red,
              textColor: Colors.white,
              onPressed: () {
                setState(() {
                  sayacDegeriniAzalt();
                });
              },
            )
          ],
        ),
      ),
    );
  }

  void sayacDegeriniArttir() {
    setState(() {
      widget.sayac++;
      debugPrint("sayac degeri ${widget.sayac}");
    });
  }

  void sayacDegeriniAzalt() {
    setState(() {
      widget.sayac--;
      debugPrint("sayac değeri ${widget.sayac}");
    });
  }
}
