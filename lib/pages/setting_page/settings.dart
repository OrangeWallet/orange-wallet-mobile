import 'package:OrangeWallet/pages/setting_page/settings/theme_setting.dart';
import 'package:OrangeWallet/resources/strings.dart';
import 'package:OrangeWallet/utils/wallet/my_wallet_core.dart';
import 'package:OrangeWallet/views/button/setting_button.dart';
import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(CustomLocalizations.of(context).getString(StringIds.settingTitle)),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: <Widget>[
            buildThemeSetting(),
            buildResetBlockChainSetting(),
          ],
        ),
      ),
    );
  }

  Builder buildThemeSetting() {
    return Builder(builder: (BuildContext context) {
      return SettingButton(
        iconData: Icons.settings_input_svideo,
        text: CustomLocalizations.of(context).getString(StringIds.settingTheme),
        onClick: () {
          showDialog(
              context: context,
              builder: (_) {
                return SimpleDialog(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1.0, color: Theme.of(context).primaryColor),
                      borderRadius: new BorderRadius.circular(20.0)),
                  title: Text(
                    CustomLocalizations.of(context).getString(StringIds.settingTheme),
                    textAlign: TextAlign.center,
                  ),
                  children: <Widget>[ThemeSetting()],
                );
              });
        },
      );
    });
  }

  Builder buildResetBlockChainSetting() {
    return Builder(builder: (BuildContext context) {
      return SettingButton(
        iconData: Icons.loop,
        text: CustomLocalizations.of(context).getString(StringIds.settingResetBlockChain),
        onClick: () {
          showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  title: Text(
                      CustomLocalizations.of(context).getString(StringIds.settingResetBlockChain)),
                  content:
                      Text(CustomLocalizations.of(context).getString(StringIds.resetBlockChainTip)),
                  actions: <Widget>[
                    FlatButton(
                      child: Text(CustomLocalizations.of(context).getString(StringIds.ok)),
                      onPressed: () async {
                        Navigator.of(context).pop();
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                  content: CircularProgressIndicator(),
                                ));
                        await MyWalletCore.getInstance().resetBlockChain();
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                    ),
                    FlatButton(
                      child: Text(CustomLocalizations.of(context).getString(StringIds.cancel)),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                );
              });
        },
      );
    });
  }
}
