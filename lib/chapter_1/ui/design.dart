import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../chapter_1.dart';

class ButtonTurleri extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Image Button ve Türleri",
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(6),
                    width: 100,
                    height: 100,
                    color: Colors.brown.shade200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: Image.asset("assets/images/gdg.png"),
                        ),
                        Text("assets image"),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(6),
                    width: 100,
                    height: 100,
                    color: Colors.brown.shade200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: Image.network(
                              "https://miro.medium.com/max/1000/1*ilC2Aqp5sZd1wi0CopD1Hw.png"),
                        ),
                        Text("Network image"),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(6),
                    width: 100,
                    height: 100,
                    color: Colors.brown.shade200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://scontent-frt3-2.cdninstagram.com/vp/4ba77d22c81035c2a4e2407cefc9ee9b/5E4074E1/t51.2885-19/50586527_2075990645812224_1379972420974149632_n.jpg?_nc_ht=scontent-frt3-2.cdninstagram.com"),
                          backgroundColor: Colors.brown,
                          radius: 40,
                        ),
                        Text("Circle Avatar "),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(6),
                    width: 100,
                    height: 100,
                    color: Colors.brown.shade200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        FlutterLogo(
                          size: 60,
                        ),
                        Text("Circle Avatar "),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(6),
                    width: 100,
                    height: 100,
                    color: Colors.brown.shade200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: Image.asset("assets/images/gdg.png"),
                        ),
                        Text("assets image"),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(6),
                    width: 100,
                    height: 100,
                    color: Colors.brown.shade200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: FlutterLogo(
                            size: 500,
                            style: FlutterLogoStyle.horizontal,
                          ),
                        ),
                        Text("flutter logo"),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(6),
                    width: 100,
                    height: 100,
                    color: Colors.brown.shade200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: Placeholder(
                            color: Colors.red,
                            strokeWidth: 2,
                          ),
                        ),
                        Text("flutter logo"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              RaisedButton(
                child: Text("Flutter deneme"),
                elevation: 50,
                textColor: Colors.white,
                onPressed: () => debugPrint("fat arrowlu button"),
                color: Colors.orange,
              ),
              RaisedButton(
                child: Text("Paü ybs"),
                textColor: Colors.white,
                color: Colors.teal,
                elevation: 20,
                onPressed: () {
                  debugPrint("normal lambda expremission");
                  debugPrint("fonk devam ediyor");
                },
              ),
              RaisedButton(
                onPressed: () {
                  uzunfonksiyon();
                },
                child: Text(".."),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 10,
              ),
              IconButton(
                icon: Icon(
                  CupertinoIcons.phone,
                  size: 50,
                ),
                onPressed: () => debugPrint("icon button kullanıldı"),
              ),
              RaisedButton(
                child: Text("burası"), 
                onPressed: ()=>debugPrint("deneme"),
              ),
             
             
            ],
          ),
        ],
      ),
    );
  }
}


  class Iskender {


  



























}

  class Kebap{













}
  class Manti {
  





















  
}
  class Tralice {
  
}

  class Kazandibi {
  



















}


  class ZeytinyagliSarma {
  















}

  class Sutlac {
  

















}



