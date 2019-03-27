import 'package:flutter/material.dart';
import 'package:fluintl/fluintl.dart';
import 'package:bip39/bip39.dart' as bip39;
import '../resources/strings.dart';
import '../views/mnemonic_field.dart';
import '../utils/wallet_manager.dart';
import '../utils/shared_preferences.dart';
import '../resources/shared_preferences_keys.dart';
import '../pages/home_page/home.dart';

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
          title: Text(CustomLocalizations.of(context).getString(StringIds.confirmMnemonic)),
        ),
        body: MnemonicField(
          handleMnemonic: (mnemonic) async {
            SpUtil spUtil = await SpUtil.getInstance();
            spUtil.putBool(SharedPreferencesKeys.backup, true);
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (BuildContext context) => HomePage()),
                (Route route) => route == null);
          },
          validate: () {
            if (bip39.mnemonicToSeedHex(_mnemonic) !=
                WalletManager.getInstance().getMasterPrivateKey()) {
              return 'It`s wrong.Please check mnemonic agian';
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
