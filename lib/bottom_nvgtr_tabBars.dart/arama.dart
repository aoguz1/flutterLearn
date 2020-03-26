import 'package:flutter/material.dart';

class AramaSayfasi extends StatelessWidget {


  AramaSayfasi(Key k) : super(key :k);  // key olarak bir değer gelecek ve bu key değerini bir üst sınıfa aktar. Bu şekilde tanımlamış olduğumuz pageStorageKeyleri bu dart dosyasında kullanabilir olduk.

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemExtent: 300,
        itemCount: 300,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10),
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(10),
              color: index % 2 == 0
                  ? Colors.orange.shade400
                  : Colors.blue.shade300,
              child: ListTile(
                title: Center(
                  child: Text(
                    index.toString(),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
