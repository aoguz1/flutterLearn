import 'package:flutter/material.dart';

class DigerFormEleman extends StatefulWidget {
  DigerFormEleman({Key key}) : super(key: key);

  @override
  _DigerFormElemanState createState() => _DigerFormElemanState();
}

class _DigerFormElemanState extends State<DigerFormEleman> {
  bool checkState = false;
  bool radioValue = false;
  String sehirGroupValue = "";
  bool switchValue = false;
  double sliderValue = 10.0;
  String secilenRenk = "Kırmızı";
  List<String> sehirler = ["Kırklareli", "Edirne", "Bursa", "Çanakkale"];
  String secilensehir = "Kırklareli";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Diger Form Elemanlari"),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              CheckboxListTile(
                title: Text("CheckBoxTitle"),
                subtitle: Text("Secondary text title"),
                secondary: Icon(Icons.add_to_photos),
                selected: true,
                // checkColor:Colors.black, tik isaretinin rengini degistirir
                // activeColor: buraya verdigimiz text ve isaretlenme renklendirmesini yapariz

                value: checkState,
                onChanged: (secildi) {
                  setState(() {
                    checkState = secildi;
                  });
                },
              ),
              RadioListTile(
                title: Text("Izmir"),
                value: "Izmir",
                groupValue: sehirGroupValue,
                onChanged: (radioNowDeger) {
                  setState(() {
                    sehirGroupValue = radioNowDeger;
                    debugPrint("secilen sehir $sehirGroupValue");
                  });
                },
              ),
              RadioListTile(
                title: Text("Istanbul"),
                value: "Istanbul",
                groupValue: sehirGroupValue,
                onChanged: (radioNowDeger) {
                  setState(() {
                    sehirGroupValue = radioNowDeger;
                    debugPrint("secilen sehir $sehirGroupValue");
                  });
                },
              ),
              RadioListTile(
                title: Text("Edirne"),
                value: "Edirne",
                groupValue: sehirGroupValue,
                onChanged: (radioNowDeger) {
                  setState(() {
                    sehirGroupValue = radioNowDeger;
                    debugPrint("secilen sehir $sehirGroupValue");
                  });
                },
              ),
              RadioListTile(
                title: Text("Denizli"),
                value: "Denizli",
                groupValue:
                    sehirGroupValue, //burada grupladığımız verilerin aynı olması gerekmektedir.
                onChanged: (radioNowDeger) {
                  // onChanged methodu ile value propertysindeki değer ile bir değişken üretip onu içeride kullanabilmemizi sağlıyor.
                  setState(() {
                    sehirGroupValue = radioNowDeger;
                    debugPrint("secilen sehir $sehirGroupValue");
                  });
                },
              ),
              SwitchListTile(
                value:
                    switchValue, //bool değer döndürür  burada tanımladığımız deger ile aşağıdaki onChanged propertysinde işlemler yapabiliyoruz.
                onChanged: (switchNowDeger) {
                  // value propertysinden gelen değer burada switchNowDeger'e atılır ve bu değişkeni kullanarak aşağıda işlemler yapabiliriz.
                  setState(() {
                    switchValue = switchNowDeger;
                    debugPrint("gelen deger $switchValue");
                  });
                },
                title: Text("Switch ListTile"),
                secondary: Icon(Icons.save_alt),
              ),
              Slider(
                value: sliderValue,
                min: 10, // sliderin başlama noktası
                max: 20, // sliderin bitiş noktası
                divisions: 20, // slider içindeki hassasiyet
                label: sliderValue
                    .toString(), // siliderin değerini yazdırır (sağa sola sürükledikçe)
                onChanged: (sliderNowDeger) {
                  setState(() {
                    sliderValue = sliderNowDeger;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              Text("DropdownButton"),
              DropdownButton<String>(
                onChanged: (oankiRenk) {
                  setState(() {
                    secilenRenk = oankiRenk;
                    debugPrint(secilenRenk);
                  });
                },
                hint: Text("Seçiniz"),
                value: secilenRenk,
                items: [
                  DropdownMenuItem<String>(
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 24,
                          width: 24,
                          color: Colors.red,
                          margin: EdgeInsets.only(right: 10),
                        ),
                        Text("Kırmızı"),
                      ],
                    ),
                    value: "Kırmızı",
                  ),
                  DropdownMenuItem<String>(
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 24,
                          width: 24,
                          color: Colors.blue,
                          margin: EdgeInsets.only(right: 10),
                        ),
                        Text("Mavi"),
                      ],
                    ),
                    value: "Mavi",
                  ),
                  DropdownMenuItem<String>(
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 24,
                          width: 24,
                          color: Colors.orange,
                          margin: EdgeInsets.only(right: 10),
                        ),
                        Text("Turuncu"),
                      ],
                    ),
                    value: "Turuncu",
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text("Listeden Alınan verilerle yapılan dinamik dropdown"),
              DropdownButton<String>(
                items: sehirler.map((oankideger) {   // sehirler isimli dizide map olarak verileri alıyoruz o an aldığımız her değer "oankideger" içine geliyor. Daha sonra oluşturduğumuz dinamik menü item içinde text ve value propertylerinde kullanılıyor. Map methodu alıp işlediği bu verileri "toList" methodu ile geri değer olarak döndürüyor. Flutter'da Form elemanlarının genel mantığı olan onChanged içine gelip orada gelensehir değişkenine gelir ve burada gelen her işlem seçilen şehir olarak setState içindeki işlem yapılıp ekranda değişiklik yapılır.
                  return DropdownMenuItem<String>(
                    child: Text(oankideger),
                    value: oankideger,
                  );
                }).toList(),
                onChanged: (gelensehir) {
                  setState(() {
                    secilensehir = gelensehir;
                  });
                },
                value: secilensehir,
              )
            ],
          ),
        ));
  }
}
