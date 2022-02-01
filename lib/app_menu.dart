import 'package:flutter/material.dart';
import 'package:master_viewer/first_page.dart';
import 'package:master_viewer/page_list_tile.dart';
import 'package:master_viewer/second_page.dart';


final _availablePages = <String, WidgetBuilder>{
  'First Page': (_) => const FirstPage(),
  'Second Page': (_) => const SecondPage()
};
class AppMenu extends StatelessWidget {
  const AppMenu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: ListView(
        children: <Widget>[
          for (var pageName in _availablePages.keys) 
            PageListTile(
              pageName: pageName,
            ),
        ],
      ),
    );
  }
}
