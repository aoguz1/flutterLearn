import 'package:flutter/material.dart';

main(List<String> args) {
  var colors;
  runApp(
    new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, accentColor: Colors.green),
      home: new Scaffold(
        appBar: AppBar(
          title: Text(
            "Deneme",
            style: TextStyle(color: Colors.white),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("FAB tıklandı");
          },
          child: Icon(Icons.add_comment, color: Colors.white),
        ),
        //floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        body: Container(
          color: Colors.teal,
          child: Row(

         

            children: <Widget>[
              Expanded(
                child: Icon(
                  Icons.panorama_wide_angle,
                  size: 54.0,
                  color: Colors.amber,
                ),
              ),
              Expanded(
                child: Icon(
                  Icons.pause,
                  size: 54.0,
                  color: Colors.orange, 
                ),
              ),
              Expanded(
                child: Icon(
                  Icons.phone,
                  size: 54.0,
                  color: Colors.white, 
                ),
              ),
              Expanded(
                child: Icon(
                  Icons.perm_media,
                  size: 54.0,
                  color: Colors.yellow, 
                ),
              ),
              Expanded(
                child: Icon(
                  Icons.people,
                  size: 54.0,
                  color: Colors.pink, 
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
