import 'package:ckbalance/pages/splash.dart';
import 'package:ckbalance/resources/shared_preferences_keys.dart';
import 'package:ckbalance/resources/strings.dart';
import 'package:ckbalance/utils/redux/store.dart' as Reducer;
import 'package:ckbalance/utils/shared_preferences.dart';
import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ckbalance/utils/redux/reducer/primary_swatch_reducer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final store = Store<Reducer.AppState>(
    Reducer.mainReducer,
    initialState: Reducer.AppState(primarySwatchState: PrimarySwatchState()),
  );

  @override
  Widget build(BuildContext context) {
    setLocalizedValues(localizedValues);
    return StoreProvider(
        store: store,
        child: StoreConnector<Reducer.AppState, PrimarySwatchState>(
          converter: (store) => store.state.primarySwatchState,
          builder: (context, primarySwatchState) {
            return MaterialApp(
              theme: ThemeData(
                  primarySwatch: primarySwatchState.color,
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
                        color: primarySwatchState.color,
                        fontSize: 26,
                      ),
                      display1: TextStyle(
                        color: primarySwatchState.color,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ))),
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                CustomLocalizations.delegate
              ],
              supportedLocales: CustomLocalizations.supportedLocales,
              home: new SplashPage(),
              title: 'CKBalance',
            );
          },
        ));
  }
}
