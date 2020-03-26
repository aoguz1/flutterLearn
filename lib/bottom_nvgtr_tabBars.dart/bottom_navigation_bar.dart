import 'package:flutter/material.dart';
import 'package:listeler2/bottom_nvgtr_tabBars.dart/anasayfa.dart';
import 'package:listeler2/bottom_nvgtr_tabBars.dart/arama.dart';
import 'package:listeler2/bottom_nvgtr_tabBars.dart/page_view.dart';
import 'package:listeler2/bottom_nvgtr_tabBars.dart/tabbar.dart';


import 'package:listeler2/main.dart';

class BottomNvgtrBar extends StatefulWidget {
  BottomNvgtrBar({Key key}) : super(key: key);

  @override
  _BottomNvgtrBarState createState() => _BottomNvgtrBarState();
}

class _BottomNvgtrBarState extends State<BottomNvgtrBar> {
  int seciliIndex = 0;
  List<Widget> tumsayfalar;
  AnasayfaBottom sayfaAna;
  AramaSayfasi sayfaArama;
  PageViewOrnek sayfaPageView;
  var aramaSayfaKeyStorage = PageStorageKey("arama_key");
  var anasayfaKeyStorage = PageStorageKey("anasayfa_key"); // burada tanımladığımız "anasayfa_key" değerini diğer pageStorageKeyler ile ayrılması içindir.

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sayfaAna = AnasayfaBottom(anasayfaKeyStorage); // yukarıda tanımlamış olduğumuz  pageStorageKey'leri oluşturuğumuz dart dosylarına gönderiyoruz , gönderdiğimiz keyleri dosyalarda consructor tanımlayarak almamız gerekli
    sayfaPageView = PageViewOrnek();
    sayfaArama = AramaSayfasi(aramaSayfaKeyStorage);
    tumsayfalar = [
      sayfaAna,
      sayfaArama,
      sayfaPageView
    ]; // ayrı dart dosyalarında oluşturduğumuz(anasayfa.dart , arama.dart) dosyalarını üst tarafta tanımlaryıp dosyaların class adlarını kullanarak ilk onlardan bir nesne oluşturup yukarıda tanımladığımız değişkenlere atıp onlardan nesneler oluştutup oluşturduğumuz deişkenleri bir liste içine atıp , liste ile kolay bir şekilde  sayfa yönetimi yapabilir hale geldik.
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Bottom Navigator Bar"),
        ),
        body: seciliIndex <= tumsayfalar.length -1
            ? tumsayfalar[seciliIndex]
            : tumsayfalar[0],
        bottomNavigationBar: bottomNavMenu(),
      ),
    );
  }

  Theme bottomNavMenu() {
    return Theme(
      data: ThemeData(
        canvasColor: Colors.teal
            .shade100, // theme data üzerinde istediğimiz gibi      özelleştirmeler yapabiliriz.
        primaryColor: Colors.black,
      ),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Anasayfa"),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.find_in_page),
              title: Text("Arama"),
              activeIcon: Icon(Icons
                  .business_center), // üzerinde tıkladığında burada vereceğimiz icon devreye girer.
              backgroundColor: Colors.teal),
          BottomNavigationBarItem(
              icon: Icon(Icons.pages),
              title: Text("Page View"),
              backgroundColor: Colors.grey),
          BottomNavigationBarItem(
              icon: Icon(Icons.tab),
              title: Text("Tabbar Örnek"),
              backgroundColor: Colors.brown),

        ],
        currentIndex: seciliIndex,
        type: BottomNavigationBarType
            .shifting, //fixed tipinde verdiğimiz backgrouncolor ve (biz burada theme içine verip canvasColors'da verdik fakat background colorda da verilebilir. Fixed'de background veya themedata içine verdiğimizrenk işlem yapar, shiftingde ise her iteme verdiğimiz degeri tabbarda görmüş oluruz tabi bunun için gerekli setState kurgusunu tamamlamamız lazım )
        onTap: (index) {
          setState(() {
            seciliIndex =index; // type  değeri shifting olduğunda index te bulunan renk değerini tüm alt bara uygular.


            if (seciliIndex==3) {
              Navigator.push(context , MaterialPageRoute(builder: (context)=>TabBarOrnek()));
            }
          });
        },
      ),
    );
  }
}
