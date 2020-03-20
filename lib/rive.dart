import 'package:rive/rive.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class RiveApp extends StatelessWidget {
  const RiveApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rive"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: 200,
            height: 200,
            child: FlareActor(
              "assets/animations/tedy.flr",
              animation: "fail",
            ),

            /* FlareActor("assets/animations/deneme2.flr",
                animation: "Demo Mode",
                alignment: Alignment.center,
                shouldClip: false,
                fit: BoxFit.cover,
                ), */
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                  labelText: "İsim Giriniz",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                  labelText: "Parola Giriniz",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  )),
            ),
          ),
          RaisedButton(onPressed: () => {})
        ],
      ),
    );
  }
}
