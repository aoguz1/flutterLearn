import 'package:flutter/material.dart';

class GridViewOrnek extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Container(
            margin: EdgeInsets.all(5),
            child: Text(
              "Merhaba Flutter $index",
              textAlign: TextAlign.center,
            ),
            alignment: Alignment.center,
           
            decoration: BoxDecoration(
              /*gradient: LinearGradient(
                colors: [Colors.blue,Colors.brown],
                begin: Alignment(1, 1),
                end: Alignment(-1, -1)
              ),
              */
               color: Colors.amber[100 * ((index) % 9)],
               image: DecorationImage(
                 image: AssetImage("assets/images/devfest.jpg"),
                 fit: BoxFit.contain,
                 alignment:Alignment.topCenter

               ),
               border: Border.all(
                 color: Colors.deepOrange,
                 width: 2,
                 style: BorderStyle.solid
               ),
               //borderRadius: BorderRadius.all(Radius.circular(9.0)),
               shape: BoxShape.circle,
               boxShadow: [
                 BoxShadow(
                   color: Colors.orangeAccent,
                   offset: Offset(3,3),
                   blurRadius: 6
                   
                 ),
                 
               ]

            ),
          ),
          onTap: ()=> debugPrint("$index numaralı kutuya bir kere bir kere "),
          onDoubleTap: ()=> debugPrint("$index numaalı kutuya çift tıklandı"),
          onLongPress: ()=> debugPrint("$index numaalı kutuya uzun basıldı"),
          onHorizontalDragStart: (e)=> debugPrint("$index numaalı kutuya uzun basıldı $e"),
          );
        });
  }

/*
GridView extend'de oluşturdğumuz widgetin genişliğine göre ekranda ayarlama yapar 
örnek 300 den 2 tane sığdırabiliyorsa 2 tane sığdırır.

GridView.extent(
      maxCrossAxisExtent: 325,
      scrollDirection: Axis.vertical,
      crossAxisSpacing: 30,
      mainAxisSpacing: 30,
      padding: EdgeInsets.all(10),
      primary: false,
      reverse: false,
      children: <Widget>[
        Container(
          child: Text(
            "Merhaba Flutter",
            textAlign: TextAlign.center,
          ),
          alignment: Alignment.center,
          color: Colors.teal.shade300,
        ),
        Container(
          child: Text(
            "Merhaba Flutter",
            textAlign: TextAlign.center,
          ),
          alignment: Alignment.center,
          color: Colors.teal.shade300,
        ),
        Container(
          child: Text(
            "Merhaba Flutter",
            textAlign: TextAlign.center,
          ),
          alignment: Alignment.center,
          color: Colors.teal.shade300,
        ),
        Container(
          child: Text(
            "Merhaba Flutter",
            textAlign: TextAlign.center,
          ),
          alignment: Alignment.center,
          color: Colors.teal.shade300,
        ),
        Container(
          child: Text(
            "Merhaba Flutter",
            textAlign: TextAlign.center,
          ),
          alignment: Alignment.center,
          color: Colors.teal.shade300,
        ),
        Container(
          child: Text(
            "Merhaba Flutter",
            textAlign: TextAlign.center,
          ),
          alignment: Alignment.center,
          color: Colors.teal.shade300,
        ),
        Container(
          child: Text(
            "Merhaba Flutter",
            textAlign: TextAlign.center,
          ),
          alignment: Alignment.center,
          color: Colors.teal.shade300,
        ),
        Container(
          child: Text(
            "Merhaba Flutter",
            textAlign: TextAlign.center,
          ),
          alignment: Alignment.center,
          color: Colors.teal.shade300,
        ),
        Container(
          child: Text(
            "Merhaba Flutter",
            textAlign: TextAlign.center,
          ),
          alignment: Alignment.center,
          color: Colors.teal.shade300,
        ),
        Container(
          child: Text(
            "Merhaba Flutter",
            textAlign: TextAlign.center,
          ),
          alignment: Alignment.center,
          color: Colors.teal.shade300,
        ),

      ],
    );

*/

/*

GridView.count'da ise kaç adet 


GridView.count(
      crossAxisCount:2;
      scrollDirection: Axis.vertical,
      crossAxisSpacing: 30,
      mainAxisSpacing: 30,
      padding: EdgeInsets.all(10),
      primary: false,
      reverse: false,
      children: <Widget>[
        Container(
          child: Text(
            "Merhaba Flutter",
            textAlign: TextAlign.center,
          ),
          alignment: Alignment.center,
          color: Colors.teal.shade300,
        ),
        Container(
          child: Text(
            "Merhaba Flutter",
            textAlign: TextAlign.center,
          ),
          alignment: Alignment.center,
          color: Colors.teal.shade300,
        ),
        Container(
          child: Text(
            "Merhaba Flutter",
            textAlign: TextAlign.center,
          ),
          alignment: Alignment.center,
          color: Colors.teal.shade300,
        ),
        Container(
          child: Text(
            "Merhaba Flutter",
            textAlign: TextAlign.center,
          ),
          alignment: Alignment.center,
          color: Colors.teal.shade300,
        ),
        Container(
          child: Text(
            "Merhaba Flutter",
            textAlign: TextAlign.center,
          ),
          alignment: Alignment.center,
          color: Colors.teal.shade300,
        ),
        Container(
          child: Text(
            "Merhaba Flutter",
            textAlign: TextAlign.center,
          ),
          alignment: Alignment.center,
          color: Colors.teal.shade300,
        ),
        Container(
          child: Text(
            "Merhaba Flutter",
            textAlign: TextAlign.center,
          ),
          alignment: Alignment.center,
          color: Colors.teal.shade300,
        ),
        Container(
          child: Text(
            "Merhaba Flutter",
            textAlign: TextAlign.center,
          ),
          alignment: Alignment.center,
          color: Colors.teal.shade300,
        ),
        Container(
          child: Text(
            "Merhaba Flutter",
            textAlign: TextAlign.center,
          ),
          alignment: Alignment.center,
          color: Colors.teal.shade300,
        ),
        Container(
          child: Text(
            "Merhaba Flutter",
            textAlign: TextAlign.center,
          ),
          alignment: Alignment.center,
          color: Colors.teal.shade300,
        ),

      ],
    );


*/

}
