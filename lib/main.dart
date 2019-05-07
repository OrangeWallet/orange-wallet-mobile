import 'package:OrangeWallet/pages/splash.dart';
import 'package:OrangeWallet/resources/strings.dart';
import 'package:OrangeWallet/utils/provide/backup_notifier.dart';
import 'package:OrangeWallet/utils/provide/balance_sync_notifier.dart';
import 'package:OrangeWallet/utils/provide/blocks_notifier.dart';
import 'package:OrangeWallet/utils/provide/import_animation_notifier.dart';
import 'package:OrangeWallet/utils/provide/net_type_notifier.dart';
import 'package:OrangeWallet/utils/provide/theme_color_notifier.dart';
import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provide/provide.dart';

void main() {
  final providers = Providers()
    ..provide(Provider.function((context) => ThemeColorProvider()))
    ..provide(Provider.function((context) => NetTypeProvider()))
    ..provide(Provider.function((context) => ImportAnimationProvider()))
    ..provide(Provider.function((context) => BackupProvider()))
    ..provide(Provider.function((context) => BalanceSyncProvider(synced: 0.0)))
    ..provide(Provider.function((context) => BlocksProvider()));
  runApp(ProviderNode(child: MyApp(), providers: providers));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentThemeColor = Provide.value<ThemeColorProvider>(context);
    setLocalizedValues(localizedValues);
    return StreamBuilder<ThemeColorProvider>(
      initialData: currentThemeColor,
      stream: Provide.stream<ThemeColorProvider>(context),
      builder: (context, snapshot) => MaterialApp(
            theme: ThemeData(
                primarySwatch: snapshot.data.color,
                fontFamily: 'Montserrat',
                textTheme: TextTheme(
                    button: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    body1: TextStyle(
                      fontSize: 18,
                    ),
                    body2: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    title: TextStyle(
                      color: snapshot.data.color,
                      fontSize: 26,
                    ),
                    display1: TextStyle(
                      color: snapshot.data.color,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ))),
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              CustomLocalizations.delegate
            ],
            supportedLocales: CustomLocalizations.supportedLocales,
            home: SplashPage(),
          ),
    );
  }
}
