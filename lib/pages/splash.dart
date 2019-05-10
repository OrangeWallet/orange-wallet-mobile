import 'dart:async';
import 'dart:io';

import 'package:OrangeWallet/pages/check_password.dart';
import 'package:OrangeWallet/pages/create_import.dart';
import 'package:OrangeWallet/resources/shared_preferences_keys.dart';
import 'package:OrangeWallet/utils/provide/backup_notifier.dart';
import 'package:OrangeWallet/utils/provide/balance_notifier.dart';
import 'package:OrangeWallet/utils/provide/blocks_notifier.dart';
import 'package:OrangeWallet/utils/provide/cells_sync_notifier.dart';
import 'package:OrangeWallet/utils/provide/import_animation_notifier.dart';
import 'package:OrangeWallet/utils/provide/net_type_notifier.dart';
import 'package:OrangeWallet/utils/provide/theme_color_notifier.dart';
import 'package:OrangeWallet/utils/shared_preferences.dart';
import 'package:OrangeWallet/utils/wallet/my_wallet_core.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provide/provide.dart';

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
      Directory appDocDir = await getTemporaryDirectory();
      if (await MyWalletCore.getInstance(walletStorePath: appDocDir.path).hasWallet()) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => CheckPasswordPage()),
            (Route route) => route == null);
      } else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => CreateImportPage()),
            (Route route) => route == null);
      }
      MyWalletCore.getInstance().blocksProvider = Provide.value<BlocksProvider>(context);
      MyWalletCore.getInstance().currentLoading = Provide.value<ImportAnimationProvider>(context);
      MyWalletCore.getInstance().cellsSyncProvider = Provide.value<CellsSyncProvider>(context);
      MyWalletCore.getInstance().balanceProvider = Provide.value<BalanceProvider>(context);
    });
  }

  handleSpData() async {
    SpUtil spUtil = await SpUtil.getInstance();
    Provide.value<ThemeColorProvider>(context).color =
        Colors.primaries[spUtil.getInt(SpKeys.themeColor, 5)];
    Provide.value<NetTypeProvider>(context).type = spUtil.getInt(SpKeys.netType, 1);
    Provide.value<BackupProvider>(context).backup = spUtil.getBool(SpKeys.backup, false);
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
