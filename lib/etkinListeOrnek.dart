import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

List<Ogrenci> tumOgrenciler = [];

class EtkinOgrenci extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    tumOgrenciGetir();
    return ListView.builder(
      itemCount: 30,
      itemBuilder: (context, index) => Card(
        elevation: 4,
        color: index % 2 == 0 ? Colors.red.shade600 : Colors.green.shade700,
        child: ListTile(
          leading: Icon(Icons.perm_contact_calendar),
          title: Text(
            tumOgrenciler[index]._isim,
            style:
                TextStyle(color: index % 2 == 0 ? Colors.white : Colors.yellow),
          ),
          subtitle: Text(tumOgrenciler[index]._aciklama),
          trailing: Icon(Icons.add),
          onTap: () => {
            //toastMessage(index, false),
            alertDialogGoster(context,index),
          },
          onLongPress: () => {toastMessage(index, true)},
        ),
      ),
    );
  }

  void tumOgrenciGetir() {
    tumOgrenciler = List.generate(
        30,
        (index) => Ogrenci("Ogrenci $index Adı", "Ogrenci $index açıkalaması",
            index % 2 == 0 ? true : false));
  }

  void toastMessage(index, bool uzunbasilma) {
    Fluttertoast.showToast(
        msg: uzunbasilma
            ? "uzun basıldı ogrencinin" + tumOgrenciler[index].toString()
            : "kısa basılma calıştı " + tumOgrenciler[index].toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  alertDialogGoster(BuildContext ctx, index) {
    showDialog(
        context: ctx,
        barrierDismissible: false,
        builder: (ctx) => AlertDialog(
              title: Text("Alert Başlığı"),
              content: SingleChildScrollView(  // single page 
                child: ListBody(
                  children: <Widget>[
                    Text("$index. deneme"),
                    Text("$index. deneme"),
                    Text("$index. deneme"),
                    Text("$index. deneme"),
                  
                  ],
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text("Tamam"),
                  onPressed: ()=>Navigator.of(ctx).pop() ,
                ),
                FlatButton(
                  child: Text("Kapat"),
                  onPressed: () => Navigator.of(ctx).pop(),
                )
              ],
            ));
  }
}

class Ogrenci {
  String _isim;
  String _aciklama;
  bool _cinsiyet;

  Ogrenci(this._isim, this._aciklama, this._cinsiyet);

  @override
  String toString() {
    // TODO: implement toString
    return "Secilen ogrencinin adi $_isim , ogrencinin acıklaması $_aciklama ";
  }
}
