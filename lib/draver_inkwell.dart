import 'package:flutter/material.dart';

class DraverInkwell extends StatefulWidget {
  @override
  _DraverInkwellState createState() => _DraverInkwellState();
}

class _DraverInkwellState extends State<DraverInkwell> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Abdullah"),
              accountEmail: Text("Oğuz"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://avatars0.githubusercontent.com/u/34376691?s=460&v=4"),
              ),
            ),
            DrawerHeader(child: ListTile(


            
            ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Draver Inkwell"),
      ),
    );
  }
}
