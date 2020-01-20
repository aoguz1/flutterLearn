import 'package:flutter/material.dart';

class TextFormFieldOrnek extends StatefulWidget {
  TextFormFieldOrnek({Key key}) : super(key: key);

  @override
  _TextFormFieldOrnekState createState() => _TextFormFieldOrnekState();
}

class _TextFormFieldOrnekState extends State<TextFormFieldOrnek> {
  String _adSoyad, _email, _sifre;
  final formKey=GlobalKey<FormState>(); // formkey tanımlıyoruz formState verilerinin içinden alavailceği 
  bool otoValidate =false;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        errorColor: Colors.red,
        // genel olarak tanımlandığı sayfa üzerinde tema değişiklikleri yapmamızı sağlar. Buraya tanımlanan tema stilleri sayfa içerisindeki widgetlere uygulanır. Eğer tasarımımıza uygun stilleri buraya yazarsak widgetlerin içlerinde renk düzenlemesi yapmamıza gerek kalmaz gerekli stil özellikleri themeData üzeirnden alır.
        hintColor: Colors
            .black38, // inputların içinde yazı olarak var olan hint özelliğinin rengini düzenleriz.
        primaryColor: Colors
            .deepPurple, //genel olarak baskın renk olarak kabul görür ve primaryColor'a ne verirsek o bizim karşımıza değer olarak çıkar.
        accentColor: Colors.lime, // floatingActionButton rengini değiştirir.
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
            child: Form(
              key: formKey, // 
              autovalidate: otoValidate, //forma girilen değerleri otomatik validate işlemini yapar, devamlı doğruluğunu denetler
              child: ListView(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                        labelStyle: TextStyle(),
                        // hintText: "Ad Soyad",
                        labelText: "Ad Soyad",
                        prefixIcon: Icon(Icons.account_circle),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        )),
                        validator: _isimKontrol,
                          onSaved: (isimVeri)=> _adSoyad =isimVeri,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        // hintText: "Ad Soyad",
                        labelText: "E-mail adresinizi giriniz",
                        prefixIcon: Icon(Icons.account_circle),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        )),
                        validator: _emailKontrol,
                        onSaved: (emailVeri)=> _email =emailVeri,

                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    obscureText:
                        true, // şifre girilirken karakterleri " *  " işareti ile kapatır.
                    decoration: InputDecoration(
                        // hintText: "Ad Soyad",
                        labelText: "Şifrenizi giriniz",
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        )),
                        validator: (String girilenVeri){  // burada girilen inputa göre inputun içindeki değeri değerlendirmeler yapabiliyoruz.
                            if (girilenVeri.length <6) {
                              return "En az 6 karakter yeterli";
                            }
                            else {
                              return null;
                            }

                        },
                          onSaved: (sifreVeri)=> _sifre =sifreVeri,  // FormState içinde tanımladığığımız değişkenlere inputun içindeki değişkenleri atıyoruz.
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
                    onPressed: () {
                      if (formKey.currentState.validate()) {  // formkey içindeki değerler validate olduğunda içeri girer
                        formKey.currentState.save();          // key içine tanımlanan değerleri kaydeder. 
                        debugPrint("Email $_email , Ad Soyad : $_adSoyad , Şifre : $_sifre"); // ekrana aldığımız değerleri basıyoruz.
                      }
                      else{

                        setState(() {
                          otoValidate =true; 
                        });
                        
                      }

                    },
                    color: Colors.green,
                  )
                ],
              ),
            ),
          )),
    );
  }
  String _emailKontrol (String email){
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
      if (!regex.hasMatch(email)) {   //regex içinde olan değerler olmadığında içeri girip ifadeyi return olarak döndürür.
        return "Geçersiz e-mail";
      }
      else {
        return null;
      }

  }                      


  String _isimKontrol(String isim) {
      RegExp regex=RegExp("^[a-zA-Z]+\$");

      if (!regex.hasMatch(isim)) {   // regex içinde olan değerler olmadığında içeri girip ifadeyi return olarak döndürür.
        return "İsim Numara İçermemeli";
      }
      else return null;


  }
}
