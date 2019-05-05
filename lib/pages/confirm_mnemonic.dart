import 'package:OrangeWallet/utils/provide/backup_notifier.dart';
import 'package:OrangeWallet/utils/wallet/my_wallet_core.dart';
import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';

import '../pages/home_page/home.dart';
import '../resources/strings.dart';
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
          title: Text(CustomLocalizations.of(context).getString(StringIds.confirmMnemonic)),
        ),
        body: MnemonicField(
          handleMnemonic: (mnemonic) async {
            await Provide.value<BackupProvider>(context).change(true);
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (BuildContext context) => HomePage()), (Route route) => route == null);
          },
          validate: () {
            List<String> inputWordList = _mnemonic.split(' ');
            List<String> myWordList = MyWalletCore.getInstance().hdCoreConfig.mnemonic.split(' ');
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
