import 'package:flutter/material.dart';

class DraverInkwell extends StatefulWidget {
  @override
  _DraverInkwellState createState() => _DraverInkwellState();
}

class _DraverInkwellState extends State<DraverInkwell> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(  // Drawer ile material dizayn özelliklerini kullanarak menü oluşturabilir ve menü içinde farklı bölümler oluşturabiliriz.
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Abdullah Oğuz"),
              accountEmail: Text("oguzabdullah39@gmail.com"),
              currentAccountPicture: CircleAvatar(
                radius: 80.0,
                backgroundImage: NetworkImage(
                    "https://avatars3.githubusercontent.com/u/34376691?s=460&u=bb49f483424c3330768c12112b67fc93273896d9&v=4"),
              ),
              otherAccountsPictures: <Widget>[
                CircleAvatar(
                  child: Text("AO"),
                ),
                CircleAvatar(backgroundColor: Colors.brown, child: Text("EN"))
              ],
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text("Anasayfa"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: Text("Ara"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  ListTile(
                    leading: Icon(Icons.perm_contact_calendar),
                    title: Text("Profil"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  Divider(),
                  InkWell(  // Inkwell olduşturduğumuz bir widgete tıklama özelliklerini kazandırabiliyoruz. 
                    onTap: () {},
                    child: ListTile(
                      leading: Icon(Icons.info),
                      title: Text("Deneme"),
                    ),
                  ),
                  AboutListTile(
                    applicationIcon: Icon(Icons.perm_device_information),
                    applicationName: "Flutter Learn",
                    aboutBoxChildren: <Widget>[
                      Text("Text1"),
                      RaisedButton(child: Text("deneme"), onPressed: () {}),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Drawer Inkwell"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text("deneme"),
          )
        ],
      ),
    );
  }
}
