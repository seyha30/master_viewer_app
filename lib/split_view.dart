import 'package:flutter/material.dart';
class SplitView extends StatelessWidget {
  final Widget menu;
  final Widget content;
  final double breakpoint;
  final double menuWidth;
  const SplitView(
      {Key? key,
      required,
      required this.menu,
      required this.content,
      this.breakpoint = 600,
      this.menuWidth = 240})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    const breakPoint = 600.0;
    if (screenWidth >= breakPoint) {
      return Row(
        children: <Widget>[
          SizedBox(
            width: menuWidth,
            child: menu,
          ),
          Container(
            width: 0.5,
            color: Colors.black,
          ),
          Expanded(
            child: content,
          ),
        ],
      );
    } else {
      return Scaffold(
        body: content,
        drawer: SizedBox(
          width: menuWidth,
          child: Drawer(
            child: menu,
          ),
        ),
      );
    }
  }
}

