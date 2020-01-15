import 'package:flutter/material.dart';

class FormIslem extends StatefulWidget {
  FormIslem({Key key}) : super(key: key);

  @override
  _FormIslemState createState() => _FormIslemState();
}

class _FormIslemState extends State<FormIslem> {
  String geleninputdeger = "";
  int sayi1 =0 ;
  int sayi2 =0;
  int toplam=0;
  int maxLines = 1;
  FocusNode _fnode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fnode = FocusNode();
    _fnode.addListener(() {
      setState(() {
        if (_fnode.hasFocus) {
          maxLines = 3;
        } else {
          maxLines = 1;
        }
      });
    });

    
  }

  @override
  void dispose() {
    //_fnode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    setState(() {
      return toplam =sayi1+sayi2;
      
    });
    return Scaffold(
        appBar: AppBar(
          title: Text("Form İşlemleri"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            FocusScope.of(context).requestFocus(_fnode);
          },
          child: Icon(Icons.add),
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: TextField(
                autofocus: false,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                maxLines: maxLines, // satır yüksekliğini temsil eder
                maxLength: 7, // max girilecek değeri gösterir
                focusNode: _fnode,
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
            Container(
              margin: EdgeInsets.symmetric(vertical: 8,horizontal: 0),
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
              color:Colors.orange,
            alignment: Alignment.center,
            child: Text("Toplam Hesaplama",
            style: TextStyle(color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w800
            
            ),
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
                   sayi1 =int.parse(s);
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
                  sayi2 =int.parse(k);
                  debugPrint("sayi 2 degeri : $sayi2");
                  debugPrint("${sayi1+sayi2}");

                  setState(() {
                    toplam=sayi2+sayi1;
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
                /* RaisedButton(child: Text("islemi yap "),
                onPressed: (){
                  setState(() {
                      toplam=sayi2+sayi1;
                  });
                },)
 */

              ],
            )
          ],
        ));
  }
}

/*Container(
        width: double.infinity, // ekran genişliğinin tamamını kaplar.
        height: MediaQuery.of(context).size.height/3, //MediaQuery.of(context).size.height ibaresi ekran yüksekliğinin tamamını kapsar
        color: Colors.teal,
      ),
      */
