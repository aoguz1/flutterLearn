import 'package:flutter/material.dart';
import 'dart:math' as matematik;

class CustomScroll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned:
              true, // uygulama scrool olduğunda appBar yukarıya sabit kalıyor.
          //title: Text("Sliver App Bar"),
          backgroundColor: Colors.blue,
          expandedHeight: 200,
          floating: false,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              "Flexiable Space Bar",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            background: Image.network(
              "https://sm.pcmag.com/t/pcmag_au/review/s/sketch/sketch_sntx.640.jpg",
              fit: BoxFit.cover,
            ), // box fitted ile resmi konumlandırma yapıyoruz.
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            sabitListeElemani(context),
          ),
        ),

        SliverGrid(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          delegate: SliverChildListDelegate(sabitListeElemani(context)),
        ),

        SliverGrid(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200),
          delegate: SliverChildBuilderDelegate(dinamikElemanUretenFonksiyon,childCount: 10),
        ),
        


        SliverList(
          delegate: SliverChildBuilderDelegate(
            dinamikElemanUretenFonksiyon,
            childCount: 30,
          ),
        ),

        //SliverGrid()
        SliverFixedExtentList(
          delegate: SliverChildListDelegate(sabitListeElemani(
              context)), // burada ekrana yazdırılacak elemanları yazdırırız.
          itemExtent: 200, // burada listenin genişliğini alır.
        ),

        SliverFixedExtentList(
          delegate: SliverChildBuilderDelegate(dinamikElemanUretenFonksiyon,
              childCount:
                  5), // burada ekrana yazdırılacak elemanları yazdırırız.
          itemExtent: 50, // burada listenin genişliğini alır.
        ),
      ],
    );
  }

  List<Widget> sabitListeElemani(BuildContext context) {
    return [
      Container(
          height: 100,
          color: Colors.teal,
          alignment: Alignment.center,
          child: Text("Merhaba ", style: TextStyle(fontSize: 18))),
      Container(
        height: 100,
        color: Colors.orange,
        alignment: Alignment.center,
        child: Text(
          "Merhaba ",
          style: TextStyle(fontSize: 18),
        ),
      ),
      Container(
        height: 100,
        color: Colors.brown,
        alignment: Alignment.center,
        child: Text(
          "Merhaba ",
          style: TextStyle(fontSize: 18),
        ),
      ),
      Container(
        height: 100,
        color: Colors.indigo,
        alignment: Alignment.center,
        child: Text(
          "Merhaba ",
          style: TextStyle(fontSize: 18),
        ),
      ),
      Container(
        height: 100,
        color: Colors.lime,
        alignment: Alignment.center,
        child: Text(
          "Merhaba ",
          style: TextStyle(fontSize: 18),
        ),
      ),
      Container(
        height: 100,
        color: Colors.lightGreen,
        alignment: Alignment.center,
        child: Text(
          "Merhaba ",
          style: TextStyle(fontSize: 18),
        ),
      ),
      Container(
        height: 100,
        color: Colors.tealAccent,
        alignment: Alignment.center,
        child: Text(
          "Merhaba ",
          style: TextStyle(fontSize: 18),
        ),
      ),
      Container(
        height: 100,
        color: Colors.pink,
        alignment: Alignment.center,
        child: Text(
          "Merhaba ",
          style: TextStyle(fontSize: 18),
        ),
      ),
      Container(
        height: 100,
        color: Colors.red,
        alignment: Alignment.center,
        child: Text(
          "Merhaba ",
          style: TextStyle(fontSize: 18),
        ),
      ),
      Container(
        height: 100,
        color: Colors.purple,
        alignment: Alignment.center,
        child: Text(
          "Merhaba ",
          style: TextStyle(fontSize: 18),
        ),
      ),
    ];
  }

  alertbutongoster(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              title: Text("Giriş Yap"),
              content: Text("Bilgileri eksiksiz tamamlayıp girişinizi yapın"),
              actions: <Widget>[
                FlatButton(
                  child: Text("Giriş Yap"),
                  onPressed: () => {
                    Navigator.of(context).pop(),
                  },
                ),
                FlatButton(
                  child: Text("Kapat"),
                  onPressed: () => {
                    Navigator.of(context).pop(),
                  },
                )
              ],
            ));
  }

  Widget dinamikElemanUretenFonksiyon(BuildContext context, int index) {
    return Container(
      
      height: 100,
      color: randomcolor(),
      alignment: Alignment.center,
      child: Text(
        "Dinamik Liste ${index + 1}",
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  randomcolor() {
    return Color.fromARGB(
        matematik.Random().nextInt(255),
        matematik.Random().nextInt(255),
        matematik.Random().nextInt(255),
        matematik.Random().nextInt(255));
  }
}
