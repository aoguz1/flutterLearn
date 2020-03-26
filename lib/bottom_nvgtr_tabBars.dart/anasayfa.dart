import 'package:flutter/material.dart';

import 'models/model.dart';

class AnasayfaBottom extends StatefulWidget {

    AnasayfaBottom(Key k) : super(key : k);

  @override
  _AnasayfaBottomState createState() => _AnasayfaBottomState();
}

class _AnasayfaBottomState extends State<AnasayfaBottom> {
  List<Veri> tumVeriler;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tumVeriler = [
      Veri("Biz Kimiz", false, "Biz kimiz içeriği buraya gelecek"),
      Veri("Biz Neredeyiz", false, "Biz neredeyiz içeriği buraya gelecek"),
      Veri("Misyonumuz", false, "Misyonumuz içeriği buraya gelecek"),
      Veri("Vizyonumuz", false, "Vizyonumuz içeriği buraya gelecek"),
      Veri("İletişim", false, "İletişim içeriği buraya gelecek"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: tumVeriler.length,
        itemBuilder: (BuildContext context, int index) {
          return ExpansionTile(
            key: PageStorageKey("$index"),   // bu bölümde birden çok index ve açılır kapanır menu olduğu için key değerlerinin index'e göre tutulması uygun olandir. Arama sayfasında ise bu tarz bir şey kullanmadık çünkü oraya gönderdiğimiz key sayfanın bulunduğu konumu tutuyordu.
            initiallyExpanded: tumVeriler[index].expanded,
            title: Text(tumVeriler[index].title),
            children: <Widget>[
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(tumVeriler[index].icerik),
                ),
                height: 100,
                width: double.infinity,
                color: index % 2 == 0
                    ? Colors.blue.shade300
                    : Colors.yellow.shade100,
              )
            ],
          );
        },
      ),
    );
  }
}
