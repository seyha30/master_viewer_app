import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app_menu.dart';
import 'first_page.dart';
import 'split_view.dart';

void main() {
  runApp( const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context , WidgetRef ref) {
   // final selectedPageBuilder = ref.watch(selectedPageBuilderProvider);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplitView(
          menu: AppMenu(),
          content: FirstPage(),
        ));
  }
}
