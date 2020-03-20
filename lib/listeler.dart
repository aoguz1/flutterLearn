import 'package:flutter/material.dart';


class Listeler extends StatelessWidget {
  List<int> ListeNumaralari = List.generate(20, (index) => index);
  List<String> ListeAltBaslik = List.generate(20, (index) => "Liste elemanı alt baslik $index");

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
        children: ListeNumaralari.map(
      (oankielaeman) => Column(
        children: <Widget>[
          Container(
            child: Card(
                color: Colors.amber.shade400,
                margin: EdgeInsets.all(5.0),
                elevation: 7.0,
                child: ListTile(
                  title: Text("Bu bir ListTile'dır"),
                  leading: Icon(Icons.android),
                  subtitle: Text(ListeAltBaslik[oankielaeman]),
                  trailing: Icon(Icons.add),
                  
                )),
          ),
          Divider(
            height: 1.0,
            color: Colors.black,
            indent: 20.0,
          ),
        ],
      ),
    ).toList());
  }
}

/*


*/

/*        Column(
              children: <Widget>[
                Container(
                  child: Card(
                      color: Colors.amber.shade400,
                      margin: EdgeInsets.all(5.0),
                      elevation: 7.0,
                      child: ListTile(
                        title: Text("Bu bir ListTile'dır"),
                        leading: Icon(Icons.android),
                        subtitle: Text(ListeAltBaslik[oankideger]),
                        trailing: Icon(Icons.add),
                      )),
                ),
                Divider(
                  height: 1.0,
                  color: Colors.black,
                  indent: 20.0,
                ),
              ],
            )

            */
