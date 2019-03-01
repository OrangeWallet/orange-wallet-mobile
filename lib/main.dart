import 'package:flutter/material.dart';
import 'package:ckbalance/pages/splash_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fluintl/fluintl.dart';
import 'package:ckbalance/resources/strings.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    setLocalizedValues(localizedValues);
    return new MaterialApp(
      theme: ThemeData(
          brightness: Brightness.light,
          fontFamily: 'Montserrat',
          buttonTheme:
              ButtonThemeData(buttonColor: Theme.of(context).primaryColor),
          textTheme: TextTheme(
              button: TextStyle(fontSize: 17, color: Colors.white),
              body1: TextStyle(fontSize: 17),
              body2: TextStyle(fontSize: 17, fontWeight: FontWeight.bold))),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        CustomLocalizations.delegate
      ],
      supportedLocales: CustomLocalizations.supportedLocales,
      home: new SplashPage(),
      title: 'CKBalance',
    );
  }
}
