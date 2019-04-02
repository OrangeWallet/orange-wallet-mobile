import 'package:ckbalance/pages/setting_page/settings/theme_setting.dart';
import 'package:ckbalance/views/button/setting_button.dart';
import 'package:flutter/material.dart';
import 'package:fluintl/fluintl.dart';
import 'package:ckbalance/resources/strings.dart';

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
}
