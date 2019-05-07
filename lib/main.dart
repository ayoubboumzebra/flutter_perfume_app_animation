import 'package:flutter/material.dart';
import 'package:furniture_app_ui/fancy_tab_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  _buildGradientContainer(double width, double heigth) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        width: width / 1.5,
        height: heigth,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xFFE5E9FB),
                  Color(0xFFffffff),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.2, 1.0])),
      ),
    );
  }

  _buildAppBar() {
    return Container(
      padding: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
    );
  }

  _buildTitle(double height) {
    return Container(
      padding: EdgeInsets.only(top: 50.0, left: 70.0, right: 10.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Discover Promo',
              style: TextStyle(fontSize: 28.0, fontFamily: 'Montserrat-Bold'),
            ),
            Text('LOREM IPSUM',
                style:
                    TextStyle(fontSize: 14.0, fontFamily: 'Montserrat-Medium'))
          ],
        ),
      ),
    );
  }

  _buildListView(double height) {
    return Container(
      height: 450.0,
      margin: EdgeInsets.only(top: 20.0),
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 50.0),
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
              child: SizedBox(
                width: 230.0,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(2.0, 10.0),
                                blurRadius: 10.0)
                          ]),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 12.0,
                        ),
                        Image.asset(
                          "assets/imgs/perfume_4.png",
                          height: 200.0,
                          width: 172.0,
                        ),
                        SizedBox(
                          height: 12.0,
                        ),
                        Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              
                              SizedBox(
                                height: 30.0,
                              ),
                              Text(
                                '126 \$',
                                style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat-Bold'),
                              ),
                              
                              SizedBox(
                                height: 30.0,
                              ),
                              Text(
                                'Hemes Armchair',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat-Bold'),
                              ),
                              Text(
                                'NEW SALE',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.grey,
                                    fontFamily: 'Montserrat-Medium'),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: TextStyle(inherit: true, color: Colors.black),
        ),
        // brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text(
                "Dribble Challenge",
                style: TextStyle(
                    inherit: true, fontWeight: FontWeight.w600, fontSize: 18.0),
              ),
            ),
            ListTile(
              leading: IconButton(icon: Icon(Icons.payment), onPressed: null),
              title: Text("Payments"),
            ),
            ListTile(
              leading:
                  IconButton(icon: Icon(Icons.graphic_eq), onPressed: null),
              title: Text("Statistics"),
            ),
            ListTile(
              leading: IconButton(icon: Icon(Icons.person), onPressed: null),
              title: Text("Profile"),
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          var width = constraints.maxWidth;
          var height = constraints.maxHeight;
          return Stack(
            fit: StackFit.expand,
            children: [
              _buildGradientContainer(width, height),
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    // _buildAppBar(),
                    _buildTitle(height),
                    _buildListView(height)
                  ],
                ),
              )
            ],
          );
        },
      ),
      bottomNavigationBar: FancyTabBar(),
    );
  }

  int _selectedTabIndex = 0;
  Icon _changeTabIcon;
  AnimationController _animationCtrlTab;
  Tween<double> _tweenTab;
  Animation _animationTab;
  @override
  void initState() {
    super.initState();

    _animationCtrlTab =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));

    _tweenTab = Tween<double>(begin: -1, end: 0);

    _animationTab = _tweenTab.animate(
        CurvedAnimation(parent: _animationCtrlTab, curve: Curves.linear))
      ..addListener(() {
        setState(() {});
      });
  }

  _animateTab(double from, double to) {
    _tweenTab.begin = from;
    _tweenTab.end = _selectedTabIndex == 0 ? -1 : 1;
    _animationCtrlTab.reset();
    _animationCtrlTab.forward();
  }

  Widget tabs() {
    return Stack(
      children: <Widget>[
        BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _selectedTabIndex = index;
              _animateTab(_animationTab.value, 1);
            });
          },
          currentIndex: _selectedTabIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.panorama_horizontal),
                title: Container(height: 0.0)),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_border),
                title: Container(height: 0.0))
          ],
        ),
        IgnorePointer(
          child: Align(
            heightFactor: 1,
            alignment: Alignment(_animationTab.value, 0),
            child: FractionallySizedBox(
              widthFactor: 1 / 2,
              child: Container(
                height: 40.0,
                margin: EdgeInsets.only(left: 70.0, right: 70.0, top: 10.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(50.0)),
                child: Text(
                  '*',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
