import 'package:flutter/material.dart';
class NavigasyonIslemleri extends StatelessWidget {
  String baslik = "B Sayfası";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Navigator app bar"),
        ),
        body: Center(
            child: Column(children: <Widget>[
          RaisedButton(
              child: Text(
                "A Sayfasına Gitxs",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.green,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ASayfasi()));
              }),
          RaisedButton(
              child: Text(
                "B Sayfasına Git ve Veri Gönder",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.indigo,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BSayfasi()));
              }),
          RaisedButton(
              child: Text(
                "Geri donus Sayfasına Git",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.blueGrey,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CSayfasi(),
                    ));
              }),
          RaisedButton(
              child: Text(
                "D Sayfasına git ve geri gelirken veri getir",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.blueGrey,
              onPressed: () {
                Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DSayfasi()))
                    .then((popOlayindanSonraGelenDeger) {
                  debugPrint(
                      "pop isleminden sonra gelen deger $popOlayindanSonraGelenDeger");
                });
              }),
          RaisedButton(
            child: Text("E sayfasına git ve geri gelme"),
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => ESayfasi()));
              debugPrint("e sayfası calıştı");
            },
          ),

           RaisedButton(
             color: Colors.orange,
            child: Text("Form İşlemlerine Git"),
            onPressed: () {
              Navigator.pushNamed(context, "/formSayfasi");
            },
          ),
          RaisedButton(
            child: Text("Listeler Sayfasına Git"),
            onPressed: () => {
              
              Navigator.pushNamed(context, "/ListeSayfasi"),
            },
          ),
         
        ])));
  }
}

class ListeSinifi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listeler Sayfası"),
      ),
      body: ListView.builder(
          itemCount: 30,
          itemBuilder: (context, int index) {
            return GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, "/detay/$index");
                //Navigator.push(context, MaterialPageRoute(builder: (context)=>ListeDetay(index)))
                // on genrate route kullanmak istemeseydik bu şekilde yapacaktık.
              },
              child: Center(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Liste elemanı $index")),
              ),
            );
          }),
    );
  }
}

class ListeDetay extends StatelessWidget {
int indexDegeri=0;
ListeDetay(this.indexDegeri);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Liste Detay Sayfası"),
        ),
        body:Center(child: Text("Tıklanılan index degeri $indexDegeri")),
        
        );
  }
}

class HataSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Hata Sayfasi"),
      ),
      body: Column(
        children: <Widget>[
          Text(
            "Hatalı tıklama yaptınız ana sayfaya gidiniz",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
          ),
          RaisedButton(
            child: Text("Ana Sayfaya Git"),
            onPressed: () {
              Navigator.pushNamed(context, "/");
            },
          ),
        ],
      ),
    );
  }
}

class ESayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("E Sayfası"),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "E Sayfası",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
              ),
              RaisedButton(
                child: Text("geri dönn"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              RaisedButton(
                child: Text("f sayfasına git"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FSayfasi()));
                },
              )
            ]),
      ),
    );
  }
}

class DSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: () {
        debugPrint("on will pop çalıştı");
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("D Sayfası"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text(
                "D Sayfası",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
              ),
              RaisedButton(
                child: Text("geri dön ve veri gönder"),
                onPressed: () => {Navigator.pop(context, true)},
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ASayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("A Sayfası"),
      ),
      body: Center(
        child: Text(
          "A Sayfasi",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}

class BSayfasi extends StatelessWidget {
  String baslikDegeri;

  BSayfasi({this.baslikDegeri}) {}
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(baslikDegeri),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Text(
            baslikDegeri,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
          ),
          RaisedButton(
            child: Text("C Sayfasına git"),
            onPressed: () {
              Navigator.pushNamed(context, "/CPage");
            },
          )
        ],
      )),
    );
  }
}

class CSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("C Sayfası"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Geri donus Sayfasi",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
          ),
          RaisedButton(
            child: Text(
              "geri don",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.red,
            onPressed: () => {
              Navigator.pop(context),
            },
          ),
          RaisedButton(
            child: Text(
              "A sayfasına Dön",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.red,
            onPressed: () => {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ASayfasi())),
            },
          ),
        ],
      )),
    );
  }
}

class FSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("A Sayfası"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "F Sayfasi",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
            ),
            RaisedButton(
              child: Text("G sayfasına git"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GSayfasi()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class GSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("G Sayfası"),
      ),
      body: Column(
        children: <Widget>[
          Text(
            "G Sayfasi",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
          ),
          RaisedButton(
            child: Text("M sayfasına git"),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MSayfasi()));
            },
          ),
        ],
      ),
    );
  }
}

class MSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("M Sayfası"),
      ),
      body: Column(
        children: <Widget>[
          Text(
            "M Sayfasi",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
          ),
          RaisedButton(
            child: Text("L sayfasına git"),
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => LSayfasi()));
            },
          ),
        ],
      ),
    );
  }
}

class LSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("L Sayfası"),
      ),
      body: Column(
        children: <Widget>[
          Text(
            "L  Sayfasi",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
          ),
          RaisedButton(
            child: Text("geri dön"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
