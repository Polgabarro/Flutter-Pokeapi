import 'package:flutter/material.dart';
import 'package:pokedex/pages/containers/detail/detail_page.dart';
import 'package:pokedex/pages/containers/list/list_page.dart';
import 'generated/i18n.dart';
import 'utils/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: [S.delegate],
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData(
      primarySwatch: Colors.blue,
      ),
        initialRoute: '/',
        routes: routes
    );
  }
}
