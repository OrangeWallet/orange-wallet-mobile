import 'package:flutter/material.dart';
import 'package:ckbalance/resources/strings.dart';
import 'package:fluintl/fluintl.dart';
import 'package:ckbalance/pages/input_password.dart';
import 'package:bip39/bip39.dart' as bip39;
import '../views/button/my_raised_button.dart';
import '../views/mnemonic_field.dart';

class ImportWalletPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<ImportWalletPage> {
  final GlobalKey<FormFieldState<String>> _fieldKey = GlobalKey<FormFieldState<String>>();

  _import() {
    final FormFieldState<String> _field = _fieldKey.currentState;
    if (_field.validate()) {}
  }

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
