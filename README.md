# Flutter Learn 

## onGenerateRoute 

> dinamik rotalar oluşturmak için kullanılır.
İf else ile de dinamik listeler arasında sayfalarımızı yönlendirebiliyoruz


```dart



//navigator_islem.dart

RaisedButton(
            child: Text("Listeler Sayfasına Git"),
            onPressed: () => {
              
              Navigator.pushNamed(context, "/ListeSayfasi"), // main.dartta ListeSayfasi isminde tnaımladığımız sayfaya gider 
            },
          ),

class ListeSinifi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listeler Sayfası"),
      ),
      body: ListView.builder( // dinamik olarak 30 elemanlı bir liste ürettik ve bu listeyi dokunmaları GestureDetector ile dinleyecek ve ona göre reaksiyon gösterebilecek.Gideceği yeri pushNamed olarak verdik 
          itemCount: 30,
          itemBuilder: (context, int index) {
            return GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, "/detay/$index"); 
                //Navigator.push(context, MaterialPageRoute(builder: (context)=>ListeDetay(index)))
                // on genrate route kullanmak istemeseydik bu şekilde yapacaktık.
                // 

                // burada önemli olan nokta tanımlanan nokta main.darttaki routeste tanımlı olmayacak.
              },
              child: Center(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Liste elemanı  $index")),
              ),
            );
          }),
    );
  }
}

class ListeDetay extends StatelessWidget {
int indexDegeri=0;
ListeDetay(this.indexDegeri);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Liste Detay Sayfası"),
        ),
        body:Center(child: Text("Tıklanılan index degeri $indexDegeri")),
        
        );
  }
}

```

```dart

// main.dart

 onGenerateRoute: (RouteSettings settings){
        List<String> pathElemanlari = settings.name.split("/");   // /detay/$index 
        // yukarıdaki işlem navigator.pushNamed ile gönderdiğimiz değeri / işaretlerinden parçalayıp diziye atar 

          if (pathElemanlari[1]=="detay") {
              return MaterialPageRoute(builder: (context)=>ListeDetay(int.parse(pathElemanlari[2])));
          }
          else{
            debugPrint("Herhangi bir sayfa ile ilişkilendirilemedi");
          }
            // diziye attığımız sayfa zincirini uygun karar yapılarına göre çözümleyip uygun sayfaya yönlendirir. 



      },

```



