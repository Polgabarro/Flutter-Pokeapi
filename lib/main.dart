import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/i18n.dart';
import 'utils/routes.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        S.delegate],
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData(
      primarySwatch: Colors.blue,
      ),
        initialRoute: '/',
        routes: routes
    );
  }
}
