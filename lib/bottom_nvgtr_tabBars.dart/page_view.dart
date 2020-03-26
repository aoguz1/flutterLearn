import 'package:flutter/material.dart';

class PageViewOrnek extends StatefulWidget {
  PageViewOrnek({Key key}) : super(key: key);

  @override
  _PageViewOrnekState createState() => _PageViewOrnekState();
}

class _PageViewOrnekState extends State<PageViewOrnek> {
  var myController =
      PageController(initialPage: 0, keepPage: true, viewportFraction: 1);
  bool checkBoxDurum = false;
  bool reverseDurum = false;
  bool pageSnappingDurum = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: PageView(
              controller: myController,
              pageSnapping:
                  pageSnappingDurum, // page snapping sayfada kaydırma yaparken diğer oluşturduğumuz bölüme otomatikman geçer , diğer bir durum ise geçiş yaparken hareket ettirdiğimiz kadar geçiş yaparız (Otomatik geçiş söz konusu olmaz).
              reverse:
                  reverseDurum, // oluşturduğumuz bölümleri tersten sararak işlem yapmamızı sağlar
              scrollDirection: checkBoxDurum == true
                  ? Axis.horizontal
                  : Axis
                      .vertical, // pageView içerisindeki oluşturduğumuz bölümleri yatay veya dikey olarak sırlalamamızı sağlar.
              onPageChanged: (index) {
                // pageView içerisinde oluşturuduğumuz değerrleri bu özellik ile  alıp kontrol edebiliriz.
                debugPrint("sayfa değişimi ile gelen değer $index");
              },

              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.indigo.shade300,
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("0"),
                      RaisedButton(
                          child: Text("Deneme"),
                          onPressed: () {
                            //  myController.jumpToPage(2); controller kullanarak ilerlemek istediğimiz sayfayı seçebiliriz.
                            //  myController.jumpTo(546);
                          }),
                      Text("sonraki sayfaya git")
                    ],
                  )),
                ),
                Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.grey.shade600,
                  child: Center(child: Text("1")),
                ),
                Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.amber.shade300,
                  child: Center(child: Text("2")),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.blueGrey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: <Widget>[
                        Checkbox(
                            value: checkBoxDurum,
                            onChanged: (r) {
                              setState(() {
                                checkBoxDurum = r;
                              });
                            }),
                        Text("Scrool Direction"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: <Widget>[
                        Checkbox(
                            value: reverseDurum,
                            onChanged: (r) {
                              setState(() {
                                reverseDurum = r;
                              });
                            }),
                        Text("Reverse"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: <Widget>[
                        Checkbox(
                            value: pageSnappingDurum,
                            onChanged: (r) {
                              setState(() {
                                pageSnappingDurum = r;
                              });
                            }),
                        Text("Page Snapping"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
