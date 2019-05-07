import 'package:flutter/material.dart';
import 'package:furniture_app_ui/tab_item.dart';

class FancyTabBar extends StatefulWidget {
  @override
  _FancyTabBarState createState() => _FancyTabBarState();
}

class _FancyTabBarState extends State<FancyTabBar>
    with SingleTickerProviderStateMixin {
  AnimationController _animationCtrl;
  Tween<double> _tween;
  Animation _animation;
  int _currentSelected = 0;

  String _tabTitle = 'home';
  IconData _tabIcon = Icons.home;
  @override
  void initState() {
    super.initState();

    _animationCtrl =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);

    _tween = Tween<double>(begin: -1, end: 0);

    _animation = _tween
        .animate(CurvedAnimation(parent: _animationCtrl, curve: Curves.easeIn))
          ..addListener(() {
            setState(() {});
          });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 65.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0)),
              color: Color(0xFFBAC3EE)),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TabItem(
                text: 'Home',
                icon: Icons.home,
                isTabSelected: _currentSelected == 0,
                currentClicked: () {
                  setState(() {
                    _initAnimation(_animation.value, -1);
                    _tabTitle = 'Home';
                    _tabIcon = Icons.home;
                    _currentSelected = 0;
                  });
                },
              ),
              TabItem(
                text: 'News',
                icon: Icons.new_releases,
                isTabSelected: _currentSelected == 1,
                currentClicked: () {
                  setState(() {
                    _initAnimation(_animation.value, 0);
                    _tabTitle = 'News';
                    _tabIcon = Icons.new_releases;
                    _currentSelected = 1;
                  });
                },
              ),
              TabItem(
                text: 'More',
                icon: Icons.more,
                isTabSelected: _currentSelected == 2,
                currentClicked: () {
                  setState(() {
                    _initAnimation(_animation.value, 1);
                    _tabTitle = 'More';
                    _tabIcon = Icons.more;
                    _currentSelected = 2;
                  });
                },
              )
            ],
          ),
        ),
        IgnorePointer(
          child: Container(
              height: 65.0,
              child: Align(
                alignment: Alignment(_animation.value, 0),
                child: FractionallySizedBox(
                  widthFactor: 1 / 3,
                  child: Container(
                    height: 40.0,
                    margin: EdgeInsets.only(left: 20.0, right: 20.0),
                    padding: EdgeInsets.only(left: 5.0, right: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Color(0xFFA3AFE3),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[Icon(_tabIcon, color: Color(0xFFE5E9FB),), Text(_tabTitle, style: TextStyle(color: Color(0xFFE5E9FB)),)],
                    ),
                  ),
                ),
              )),
        )
      ],
    );
  }

  _initAnimation(double begin, double end) {
    _tween.begin = begin;
    _tween.end = end;
    _animationCtrl.reset();
    _animationCtrl.forward();
  }
}
