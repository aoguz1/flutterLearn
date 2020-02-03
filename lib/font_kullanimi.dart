import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontKullanimi extends StatelessWidget {
  const FontKullanimi({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Font Kullanımı"),
        ),
        body: Column(
          children: <Widget>[
            Center(
              child: Container(
                child: Center(
                    child: Text(
                  "Font Kullanımı",
                  style: GoogleFonts.molle(  // google fonts eklentisi kullanılarak widget içinde kullandığımız text'in stlini değiştiridik
                  
                    textStyle: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                )),
              ),
            ),
            Text("deneme"),
          ],
        ),
      ),
    );
  }
}
