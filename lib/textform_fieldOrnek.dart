

import 'package:flutter/material.dart';

class TextFormFieldOrnek extends StatefulWidget {
  TextFormFieldOrnek({Key key}) : super(key: key);

  @override
  _TextFormFieldOrnekState createState() => _TextFormFieldOrnekState();
}

class _TextFormFieldOrnekState extends State<TextFormFieldOrnek> {
  @override
  Widget build(BuildContext context) {
    return Theme(

      data: ThemeData( // genel olarak tanımlandığı sayfa üzerinde tema değişiklikleri yapmamızı sağlar. Buraya tanımlanan tema stilleri sayfa içerisindeki widgetlere uygulanır. Eğer tasarımımıza uygun stilleri buraya yazarsak widgetlerin içlerinde renk düzenlemesi yapmamıza gerek kalmaz gerekli stil özellikleri themeData üzeirnden alır.

          primaryColor: Colors.deepPurple, //genel olarak baskın renk olarak kabul görür ve primaryColor'a ne verirsek o bizim karşımıza değer olarak çıkar. 
          accentColor: Colors.lime,  // floatingActionButton rengini değiştirir.

          

      ),
         
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {},
          ),
          appBar: AppBar(
            title: Text("TextFormFiled İşlemleri"),
          ),
          body: Padding(
            padding: EdgeInsets.all(18),
            child: ListView(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                      // hintText: "Ad Soyad",
                      labelText: "Ad Soyad",
                      prefixIcon: Icon(Icons.account_circle),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      // hintText: "Ad Soyad",
                      labelText: "E-mail adresinizi giriniz",
                      prefixIcon: Icon(Icons.account_circle),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      )),
                ),
                RaisedButton.icon(
                  icon: Icon(
                    Icons.save,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Kaydet",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {},
                  color: Colors.green,
                )
              ],
            ),
          )), 
    );
  }
}
