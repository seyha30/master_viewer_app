import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:master_viewer/first_page.dart';
import 'package:master_viewer/page_list_tile.dart';
import 'package:master_viewer/second_page.dart';

final selectedPageNameProvider = StateProvider<String>((ref) {
  return _availablePages.keys.first;
});
final selectedPageBuilderProvider = Provider<WidgetBuilder>((ref) {
  // watch for state changes inside selectedPageNameProvider
  final selectedPageKey = ref.watch(selectedPageNameProvider.state).state;
  // return the WidgetBuilder using the key as index
  return _availablePages[selectedPageKey]!;
});
final _availablePages = <String, WidgetBuilder>{
  'First Page': (_) => const FirstPage(),
  'Second Page': (_) => const SecondPage()
};
class AppMenu extends ConsumerWidget {
 AppMenu({Key? key}) : super(key: key);

void _selectPage(BuildContext context, WidgetRef ref, String pageName) {
  if (ref.read(selectedPageNameProvider.state).state != pageName) {
    ref.read(selectedPageNameProvider.state).state = pageName;
  }
}

  @override
  Widget build(BuildContext context , WidgetRef ref) {
       // 3. watch the provider's state
 final selectedPageName = ref.watch(selectedPageNameProvider.state).state;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: ListView(
        children: <Widget>[
          for (var pageName in _availablePages.keys) 
            PageListTile(
              pageName: pageName,
              selectedPageName:selectedPageName ,
              onPressed: () =>_selectPage(context,ref,pageName)
            ),
        ],
      ),
    );
  }
}
