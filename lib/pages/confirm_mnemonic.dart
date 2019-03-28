import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';

import '../pages/home_page/home.dart';
import '../resources/shared_preferences_keys.dart';
import '../resources/strings.dart';
import '../utils/shared_preferences.dart';
import 'package:ckbalance/utils/wallet/wallet_manager.dart';
import '../views/mnemonic_field.dart';

class ConfirmMnemonic extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<ConfirmMnemonic> {
  String _mnemonic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(CustomLocalizations.of(context)
              .getString(StringIds.confirmMnemonic)),
        ),
        body: MnemonicField(
          handleMnemonic: (mnemonic) async {
            SpUtil spUtil = await SpUtil.getInstance();
            spUtil.putBool(SharedPreferencesKeys.backup, true);
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (BuildContext context) => HomePage()),
                (Route route) => route == null);
          },
          validate: () {
            List<String> inputWordList = _mnemonic.split(' ');
            List<String> myWordList =
                WalletManager.getInstance().getMnemonic().split(' ');
            for (int i = 0; i < inputWordList.length; i++) {
              if (inputWordList[i] != myWordList[i]) {
                return 'It`s wrong.Please check mnemonic agian';
              }
            }
            return null;
          },
          onChanged: (value) {
            _mnemonic = value;
          },
          buttonText: 'Check',
        ));
  }
}
