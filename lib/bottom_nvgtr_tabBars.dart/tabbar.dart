import 'package:flutter/material.dart';

class TabBarOrnek extends StatefulWidget {
  TabBarOrnek({Key key}) : super(key: key);

  @override
  _TabBarOrnekState createState() => _TabBarOrnekState();
}

class _TabBarOrnekState extends State<TabBarOrnek>
    with SingleTickerProviderStateMixin {
  TabController tabController; // controller tanımladık.

  @override
  void initState() {
    super.initState();
    tabController = TabController(
        length: 3,
        vsync:this); // bu kısımda oluşturduğumuz controller'ı kaç adet tabdan oluşacağını vb özellikleri tanımlıyoruz.
  }

  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          bottom: tabBarim(),
          title: Text("Tabbar Kulanımı"),
        ),
        bottomNavigationBar: tabBottomBarim(),
        body: TabBarView(
          controller: tabController, // yukarıda oluşturduğumuz controllerleri her widget'e tanımlayıp tablar ile tıklanıldığında erişilecek sayfa arasında bağlantı kurduk.
          children: <Widget>[
            Container(
              child: Center(
                  child: Text(
                "TAB 1",
                style: TextStyle(fontSize: 30),
              )),
              color: Colors.orange.shade400,
            ),
            Container(
              child:
                  Center(child: Text("TAB 2", style: TextStyle(fontSize: 30))),
              color: Colors.red.shade200,
            ),
            Container(
              child:
                  Center(child: Text("TAB 3", style: TextStyle(fontSize: 30))),
              color: Colors.brown.shade200,
            ),
          ],
        ),
      ),
    );
  }

// controllerleri ilişkilendirdik çünkü sayfalar ve oluşturduğumuz widgetleri arasıdna bağlantı kurabilmek amacıyla.

  TabBar tabBarim() {
    return TabBar(controller: tabController, tabs: [  // tabbarın tablarini oluşturup conrolleri tanımladık.
      Tab(
        text: "Tab 1",
        icon: Icon(Icons.keyboard),
      ),
      Tab(
        text: "Tab 2",
        icon: Icon(Icons.account_circle),
      ),
      Tab(
        text: "Tab 3",
        icon: Icon(Icons.airplay),
      )
    ]);
  }

  Widget tabBottomBarim() {
    return Container(
      color: Colors.indigo.shade200,
      child: TabBar(controller: tabController, tabs: [
        Tab(
          text: "Tab 1",
          icon: Icon(Icons.keyboard),
        ),
        Tab(
          text: "Tab 2",
          icon: Icon(Icons.account_circle),
        ),
        Tab(
          text: "Tab 3",
          icon: Icon(Icons.airplay),
        )
      ]),
    );
  }
}
