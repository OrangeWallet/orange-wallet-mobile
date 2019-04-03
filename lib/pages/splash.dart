import 'dart:async';

import 'package:ckbalance/pages/check_password.dart';
import 'package:ckbalance/pages/create_import.dart';
import 'package:ckbalance/resources/shared_preferences_keys.dart';
import 'package:ckbalance/utils/redux/reducer/primary_swatch_reducer.dart';
import 'package:ckbalance/utils/redux/store.dart';
import 'package:ckbalance/utils/shared_preferences.dart';
import 'package:ckbalance/utils/wallet/wallet_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _SplashState();
}

class _SplashState extends State<SplashPage> {
  Timer _timer;

  @override
  void initState() {
    super.initState();
    handleSpData();
    _timer = Timer(const Duration(seconds: 2), () async {
      if (await WalletManager.getInstance().hasWallet()) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => CheckPasswordPage()),
            (Route route) => route == null);
      } else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => CreateImportPage()),
            (Route route) => route == null);
      }
    });
  }

  void handleSpData() async {
    SpUtil spUtil = await SpUtil.getInstance();
    int themeColor = spUtil.getInt(SpKeys.themeColor, 5);
    StoreProvider.of<AppState>(context)
        .dispatch(PrimarySwatchAction(PrimarySwatchState(color: Colors.primaries[themeColor])));
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
          child: new Image.asset(
        'images/ic_launcher.png',
        width: 70,
        height: 70,
      )),
      backgroundColor: Colors.white,
    );
  }
}
