import 'package:flutter/material.dart';
import 'package:ckbalance/resources/strings.dart';
import 'package:fluintl/fluintl.dart';
import 'package:ckbalance/pages/input_password.dart';
import '../views/mnemonic_field.dart';

class ImportWalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(CustomLocalizations.of(context).getString(StringIds.importWalletTitle)),
        leading: IconButton(
          tooltip: 'back',
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: MnemonicField(
        handleMnemonic: (mnemonic) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => InputPasswordPage(
                    mnemonic: mnemonic,
                  )));
        },
      ),
    );
  }
}
