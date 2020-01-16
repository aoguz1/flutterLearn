import 'package:flutter/material.dart';

class FormIslem extends StatefulWidget {
  FormIslem({Key key}) : super(key: key);
  @override
  _FormIslemState createState() => _FormIslemState();
}

class _FormIslemState extends State<FormIslem> {
  String geleninputdeger = "";
  int sayi1 = 0;
  int sayi2 = 0;
  int toplam = 0;
  int maxLines = 1;
  TextEditingController controller1;

  FocusNode
      _fnode; // focus olma durumunu tetikleyeceğimiz ve focus olma durumunu yönlendirebileceğimiz değişken

  @override
  void initState() {
    // TODO: implement initState
    super
        .initState(); // initstate uygulama açıldığında consructordan sonra çalışan bir method
    _fnode = FocusNode();
    controller1 = TextEditingController(text: "deneme");
    _fnode.addListener(() {
      // initstate normlade uygulama açıldıktan sonra 1 kez çalışır ama addListener() methodu ile olan _fnode tetiklenmesini devamlı dinleyerek içerisinde yazdığımız komuta uygun reaksiyonlar verir.
      setState(() {
        if (_fnode.hasFocus) {
          // _fnode'nin focus olma durumu
          maxLines = 3;
        } else {
          maxLines = 1;
        }
      });
    });
  }

  @override
  void dispose() {
    // dispose ise uygulama kapandıktan sonra çalışan method
    _fnode.dispose();
    controller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Form İşlemleri"),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[

            Container(
              width: 30,
              height: 30,
             child:  FloatingActionButton(
          onPressed: () {
          controller1.text="en üste floatingActionButtonaBasildi";
          },
          backgroundColor: Colors.teal,
          child: Icon(Icons.arrow_upward, size: 18,),
          
        ),
            ),



             FloatingActionButton(
          onPressed: () {
            debugPrint(controller1.text);
          },
          child: Icon(Icons.arrow_upward),
          backgroundColor: Colors.indigo,
          mini: true,
        ),
          SizedBox(height: 10,),

            FloatingActionButton(
          onPressed: () {
            FocusScope.of(context).requestFocus(_fnode);
          },

          child: Icon(Icons.add),
        ),



          ],
        ),

          


        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: TextField(
                autofocus: false,
                controller: controller1,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                maxLines: maxLines, // satır yüksekliğini temsil eder
                maxLength: 7, // max girilecek değeri gösterir
                focusNode:
                    _fnode, //focus olma durumunu tetikleyeceğimiz ve focus olma durumunu yönlendirebileceğimiz değişken
                onSubmitted: (String s) {
                  debugPrint(s);

                  setState(() {
                    geleninputdeger = s;
                  });
                },
                decoration: InputDecoration(
                  hintText: "Girmek istediğiniz metni yazınız",
                  labelText: "Başlık",

                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(
                          8))), // girilmek istenen inputun çerçevesine border koyarak daha etkileşimli bir hale getirir.
                  fillColor: Colors.orange
                      .shade50, // eğer filled true ise buraya yazılan rengi inputun içinde uygular
                  filled: true,
                  icon: Icon(Icons.adb), // inputun soluna icon ekler
                  prefixIcon:
                      Icon(Icons.add_box), //input içinde sol tarafa icon ekler
                  suffixIcon: Icon(
                      Icons.add_location), //input içinde sağ tarafa icon ekler
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: TextField(
                autofocus: false,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                maxLines: 1, // satır yüksekliğini temsil eder
                maxLength: 7, // max girilecek değeri gösterir
                onSubmitted: (String s) {
                  debugPrint(s);
                  geleninputdeger = s;
                },

                decoration: InputDecoration(
                  hintText:
                      "Girmek istediğiniz metni yazınız", // inputa bilgilendirici bir metin yazar.
                  labelText:
                      "Başlık", // inputa tıklanmadan önce bilgilendirici bir metin yazar.
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(
                          8))), // girilmek istenen inputun çerçevesine border koyarak daha etkileşimli bir hale getirir.
                  fillColor: Colors.orange
                      .shade50, // eğer filled true ise buraya yazılan rengi inputun içinde uygular
                  filled: true,
                  icon: Icon(Icons.adb), // inputun soluna icon ekler
                  prefixIcon:
                      Icon(Icons.add_box), //input içinde sol tarafa icon ekler
                  suffixIcon: Icon(
                      Icons.add_location), //input içinde sağ tarafa icon ekler
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
              child: Align(
                alignment: Alignment.center,
                child: Text(geleninputdeger),
              ),
              width: double.infinity,
              height: 200,
              color: Colors.teal,
            ),
            Container(
              width: double.infinity,
              height: 50,
              color: Colors.orange,
              alignment: Alignment.center,
              child: Text(
                "Toplam Hesaplama",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w800),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                keyboardType: TextInputType.number,
                autofocus: false,
                maxLength: 30,
                maxLines: 1,
                onSubmitted: (s) {
                  sayi1 = int.parse(s);
                  debugPrint("sayi 1 degeri : $sayi1");
                },
                decoration: InputDecoration(
                    labelText: "Birinci Sayiyi giriniz",
                    prefixIcon: Icon(Icons.arrow_forward_ios),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                keyboardType: TextInputType.number,
                autofocus: false,
                maxLength: 30,
                maxLines: 1,
                onSubmitted: (k) {
                  sayi2 = int.parse(k);
                  debugPrint("sayi 2 degeri : $sayi2");
                  debugPrint("${sayi1 + sayi2}");

                  setState(() {
                    toplam = sayi2 + sayi1;
                  });
                },
                decoration: InputDecoration(
                    labelText: "İkinci sayiyi giriniz",
                    prefixIcon: Icon(Icons.arrow_forward_ios),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)))),
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 50,
                  color: Colors.lime,
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.teal.shade600,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    width: double.infinity,
                    height: 40,
                    child: Text("$toplam"),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
