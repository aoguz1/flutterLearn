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
                  showDatePicker(
                    context: context,
                    firstDate: ucAyOnce,
                    lastDate: yirmiGunSonra,
                    initialDate: suAn,
                  ).then((gelenTarihDeger) {
                    debugPrint(gelenTarihDeger.toString());
                    debugPrint(gelenTarihDeger.toUtc().toString());
                    debugPrint(gelenTarihDeger.toIso8601String());
                    debugPrint(gelenTarihDeger.millisecondsSinceEpoch
                        .toString()); // milisaniye cinsinden yazar
                    var yenidate = DateTime.parse(
                        gelenTarihDeger.toUtc().toIso8601String());
                    debugPrint(yenidate.toIso8601String());
                    print(
                        formatDate(gelenTarihDeger, [yyyy, '-', mm, '-', dd]));
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
                  ).then((gelensaatVerisi){
                    debugPrint(gelensaatVerisi.hour.toString() + ' : ' + gelensaatVerisi.minute.toString());

                    debugPrint(gelensaatVerisi.format(context)); // gelensaatverisi farklı olduğu için eklediğimiz pakette datetime tipinde çevirme yapıyordu. bizde gelensaatVerisi degerini format edip çevirme işlemi yaptık.
              
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
