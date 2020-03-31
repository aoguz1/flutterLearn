import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listeler2/bottom_nvgtr_tabBars.dart/bottom_navigation_bar.dart';

import 'package:listeler2/chapter_1/ui/myapp.dart';
import 'package:listeler2/custom_scrolls_sliver.dart';
import 'package:listeler2/draver_inkwell.dart';
import 'package:listeler2/font_kullanimi.dart';
import 'package:listeler2/hero_Kullanimi/sayfa1.dart';
import 'package:listeler2/navigator_islem.dart';
import 'package:listeler2/rive.dart';
import 'package:listeler2/stepper.dart';
import 'package:listeler2/tarihSaat.dart';
import 'package:listeler2/textform_fieldOrnek.dart';

import 'custom_scrolls_sliver.dart';
import 'diger_formElemanlari.dart';
import 'form_islem.dart';
import 'listeler.dart';
import 'gridView.dart';
import 'etkinListeOrnek.dart';
import 'package:rive/rive.dart';
import 'package:flare_flutter/flare_actor.dart';

void main()=> runApp(Anasayfa());
  
    
 class Anasayfa extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
    theme: ThemeData(
     /*  textTheme: GoogleFonts.robotoSlabTextTheme(
        Theme.of(context).textTheme,   
      ------ 
      Google Fonts eklentisi kullanılarak font dosyası indirmeden uygulamanın tüm sayfalarına buradaki theme data içinden uygulamalar yapılabilir


      ), */
      primaryColor: Colors.indigo,
    ),
    title: "flutter ",

    // initialRoute: "/CPage", uygulama açıdığında başlayarak zincirlenmiş bir rotayı temsil eder
    //örnek  :  "/CPage/GPage/FPage" ilk fpage yi açar geri tuşuna basıldıkça arkadaki zincirdeki sayfaları çalıştırır.
    // tanumlaması : "/CPage/GPage/FPage" : (context)=> FSayfasi(),
    //-----

    initialRoute: '/HeroKullanimi',

    routes: {
      // route işlemleri ile string karakterlere atadığımız değerleri sayflar arası geçişlerde kullanabiliriz.

      '/': (context) => NavigasyonIslemleri(),
      '/APage': (context) => ASayfasi(),
      '/BPage': (context) => BSayfasi(),
      '/CPage': (context) => CSayfasi(),
      '/DPage': (context) => DSayfasi(),
      '/EPage': (context) => ESayfasi(),
      '/FPage': (context) => FSayfasi(),
      '/formSayfasi': (context) => FormIslem(),
      '/riveSayfa' : (context) => RiveApp(),
      '/textfieldIslem': (context) => TextFormFieldOrnek(),
      // '/GPage' :(context)=>GSayfasi(),
      '/ListeSayfasi': (context) => ListeSinifi(),
      '/DigerFromEleman': (context) => DigerFormEleman(),
      '/TarihSaat': (context) => TarihSaatOrnek(),
      '/StepperOrnek': (context) => StepperO(),
      '/FontKullanimi': (context) => FontKullanimi(),
      '/DraverInkwell' : (context) => DraverInkwell(),
      '/BottomNavigation' : (context) => BottomNvgtrBar(),
      '/HeroKullanimi' :(context) => Sayfa1(),
    },

    onGenerateRoute: (RouteSettings settings) {
      List<String> pathElemanlari = settings.name.split("/");

      if (pathElemanlari[1] == "detay") {
        return MaterialPageRoute(
            builder: (context) => ListeDetay(int.parse(pathElemanlari[2])));
      } else {
        debugPrint("Herhangi bir sayfa ile ilişkilendirilemedi");
      }
    },
    onUnknownRoute: (RouteSettings settings) =>
        MaterialPageRoute(builder: (context) => HataSayfasi()),
    debugShowCheckedModeBanner: false,

    //home:NavigasyonIslemleri(),
  ); 
 }
}

    
    

