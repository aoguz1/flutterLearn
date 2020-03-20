x# Flutter Learn 

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

## Form İşlemleri 


> Oluşturduğumuz sayfalarda form işlemlerini koyacağımız inputlarla verileri alabiliriz.


### **Form İşlemleri ile ilgili widgetler**

#### TextField ve TextFormField 

- TextField sayfada bir input oluşturup kullanıcının buraya veri girmesini sağlar.

- TextFromField widgeti de aynı görevi yapar ama **validate** ve **onSaved** özellikleri ile veri kontrolü ve yönlendirmeleri yapabiliriz.
  
- TextFromField , TextField'ın özelliklerini kapsar ve genellikle TextFormField kullanılır.
  


```dart


TextField(
                autofocus: false,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                maxLines: 1, // satır yüksekliğini temsil eder
                maxLength: 7, // max girilecek değeri gösterir
                onSubmitted: (String s) {
                  debugPrint(s);
                  geleninputdeger = s;
                },

                decoration: InputDecoration(
                  hintText:
                      "Girmek istediğiniz metni yazınız", // inputa bilgilendirici bir metin yazar.
                  labelText:
                      "Başlık", // inputa tıklanmadan önce bilgilendirici bir metin yazar.
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(
                          8))), // girilmek istenen inputun çerçevesine border koyarak daha etkileşimli bir hale getirir.
                  fillColor: Colors.orange
                      .shade50, // eğer filled true ise buraya yazılan rengi inputun içinde uygular
                  filled: true,
                  icon: Icon(Icons.adb), // inputun soluna icon ekler
                  prefixIcon:
                      Icon(Icons.add_box), //input içinde sol tarafa icon ekler
                  suffixIcon: Icon(
                      Icons.add_location), //input içinde sağ tarafa icon ekler
                ),
              ),
```


#### SizeBox

- iki nesne ara$$sına genişliğini ve yüksekliğini verebildiğimiz bir kutu ekleyip nesneler arasındaki mesafeyi ayarlayabiliriz.

```dart
SizedBox(height: 10),
```
