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
    // initialRoute: "/CPage", uygulama açıdığında başlayarak zincirlenmiş bir rotayı temsil eder
    //örnek  :  "/CPage/GPage/FPage" ilk fpage yi açar geri tuşuna basıldıkça arkadaki zincirdeki sayfaları çalıştırır.
    // tanumlaması : "/CPage/GPage/FPage" : (context)=> FSayfasi(),
    //-----
    routes: { // route işlemleri ile string karakterlere atadığımız değerleri sayflar arası geçişlerde kullanabiliriz.
     
      '/'      :(context)=> NavigasyonIslemleri(),
      '/APage' :(context)=> ASayfasi(),
      '/BPage' :(context)=> BSayfasi(),
      '/CPage' :(context)=>CSayfasi(),
      '/DPage' :(context)=>DSayfasi(),
      '/EPage' :(context)=>ESayfasi(),
      '/FPage' :(context)=>FSayfasi(),
     // '/GPage' :(context)=>GSayfasi(),
      '/ListeSayfasi': (context)=>ListeSinifi(),
    },

      onGenerateRoute: (RouteSettings settings){
        List<String> pathElemanlari = settings.name.split("/");

          if (pathElemanlari[1]=="detay") {
              return MaterialPageRoute(builder: (context)=>ListeDetay(int.parse(pathElemanlari[2])));
          }
          else{
            debugPrint("Herhangi bir sayfa ile ilişkilendirilemedi");
          }



      },
      onUnknownRoute: (RouteSettings settings) => MaterialPageRoute(builder:(context)=>HataSayfasi()),
    
    debugShowCheckedModeBanner: false,
    theme: ThemeData(),
    //home:NavigasyonIslemleri(), 
  ));
}
