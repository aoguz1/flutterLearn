import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class TarihSaatOrnek extends StatefulWidget {
  TarihSaatOrnek({Key key}) : super(key: key);

  @override
  _TarihSaatOrnekState createState() => _TarihSaatOrnekState();
}

class _TarihSaatOrnekState extends State<TarihSaatOrnek> {
  @override
  Widget build(BuildContext context) {
    DateTime suAn = DateTime.now();
    DateTime ucAyOnce = DateTime(2020, suAn.month - 3);
    DateTime yirmiGunSonra = DateTime(2020, 1, suAn.day + 20);

    TimeOfDay suankisaat = TimeOfDay.now();

    return Scaffold(
      appBar: AppBar(
        title: Text("Tarih Saat İşlemleri"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.green,
                child: Text(
                  "Tarih Seç",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  showDatePicker(   // future döndüren bir widgettir. Yani ne zaman sonlanacağı belli olmayan biz future içeren widgetler için async ve await yada widgetten sonra ".then()" ifadesini kullanıyoruz. 
                    context: context,
                    firstDate: ucAyOnce,
                    lastDate: yirmiGunSonra,
                    initialDate: suAn,
                  ).then((gelenTarihDeger) {  // widgetten gelen değeri "gelenTarihDeger" 'e atar ve biz "gelenTarihDeger" değeri ile içeride ilgili işlemleri yapabiliyoruz.
                    debugPrint(gelenTarihDeger.toString());  // dateTimePicker'dan alınan değeri stringe çevirip yazdırır.
                    debugPrint(gelenTarihDeger.toUtc().toString()); //ateTimePicker'dan alınan değeri UTC zaman dilimine çevirip yazdırır.
                    debugPrint(gelenTarihDeger.toIso8601String());  // ateTimePicker'dan alınan değeri alışık olduğumuz dd--mm-yyyy format biçiminde yazırabilir 
                    debugPrint(gelenTarihDeger.millisecondsSinceEpoch //ateTimePicker'dan alınan değeri milisaniye şekline çevirip yazıdır.
                        .toString()); // milisaniye cinsinden yazar
                    var yenidate = DateTime.parse(
                        gelenTarihDeger.toUtc().toIso8601String());  // aldığımız değişkeni parse edip bir değişkene atayabiliriz 
                    debugPrint(yenidate.toIso8601String());  // bu değişkeni tekrardan Iso8601 format biçiminde yazdırabiliriz 
                    print(
                        formatDate(gelenTarihDeger, [yyyy, '-', mm, '-', dd]));  // dateFormat paketinin kullanım şekli 
                    print(
                        formatDate(gelenTarihDeger, [dd, '-', mm, '-', yyyy]));
                  });
                },
              ),
              RaisedButton(
                child: Text(
                  "Saat Seç",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.red,
                onPressed: () {
                  showTimePicker(
                    context: context,
                    initialTime: suankisaat,
                  ).then((gelensaatVerisi) {
                    debugPrint(gelensaatVerisi.hour.toString() +  // gelensaatVerisi'nden aldığımız verileri dakika ve saat biçiminde alıp ekrana yazdırabiliriz.
                        ' : ' +
                        gelensaatVerisi.minute.toString());

                    debugPrint(gelensaatVerisi.format(  
                        context)); // gelensaatverisi farklı olduğu için eklediğimiz pakette datetime tipinde çevirme yapıyordu. bizde gelensaatVerisi degerini format edip çevirme işlemi yaptık.
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
