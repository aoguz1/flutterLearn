

import 'package:flutter/material.dart';
import 'package:listeler2/custom_scrolls_sliver.dart';
import 'package:listeler2/navigator_islem.dart';


import 'custom_scrolls_sliver.dart';
import 'listeler.dart';
import 'gridView.dart';
import 'etkinListeOrnek.dart';




main(List<String> args) {
  runApp(MaterialApp(
    title: "flutter ",
    /*initialRoute: "/CPage",
    routes: { // route işlemleri ile string karakterlere atadığımız değerleri sayflar arası geçişlerde kullanabiliriz.
     
     // '/'      :(context)=> GridViewOrnek(),
     // '/APage' :(context)=> ASayfasi(),
     // '/BPage' :(context)=> BSayfasi(),
     // '/CPage' :(context)=>CSayfasi(),
     // '/DPage' :(context)=>DSayfasi(),
     // '/EPage' :(context)=>ESayfasi(),
     // '/FPage' :(context)=>FSayfasi(),
     // '/GPage' :(context)=>GSayfasi(),
    },
    */
    debugShowCheckedModeBanner: false,
    theme: ThemeData(),
    home:NavigasyonIslemleri(), 
  ));
}
