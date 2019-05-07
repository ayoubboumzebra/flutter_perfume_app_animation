import 'package:flutter/material.dart';

class TabItem extends StatefulWidget {
  String text;
  IconData icon;
  Function currentClicked;
  bool isTabSelected;

  TabItem(
      {@required this.text,
      @required this.icon,
      @required this.currentClicked,
      @required this.isTabSelected});

  @override
  _TabItemState createState() => _TabItemState();
}

const double ICON_OFF = 5;
const double ICON_ON = 0;
const double ALPHA_OFF = 0;
const double ALPHA_ON = 1;
const int ANIM_DURATION = 500;

class _TabItemState extends State<TabItem> {
  double iconYAlign = ICON_ON;
  double iconAlpha = ALPHA_OFF;

  @override
  void initState() {
    super.initState();
    _setIconAlpha();
  }

  @override
  void didUpdateWidget(TabItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    _setIconAlpha();
  }

  _setIconAlpha() {
    setState(() {
      iconYAlign = (widget.isTabSelected) ? ICON_OFF : ICON_ON;
      iconAlpha = (widget.isTabSelected) ? ALPHA_OFF : ALPHA_ON;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: AnimatedAlign(
          duration: Duration(milliseconds: ANIM_DURATION),
          alignment: Alignment(0, iconYAlign),
          curve: Curves.easeIn,
          child: AnimatedOpacity(
            duration: Duration(milliseconds: ANIM_DURATION),
            opacity: iconAlpha,
            child: IconButton(
              icon: Icon(widget.icon, size: 28.0,color: Color(0xFFE5E9FB),),
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onPressed: () {
                widget.currentClicked();
              },
            ),
          ),
        ),
      ),
    );
  }
}
