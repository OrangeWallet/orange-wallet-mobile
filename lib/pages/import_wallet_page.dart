import 'package:flutter/material.dart';
import 'package:ckbalance/resources/strings.dart';
import 'package:fluintl/fluintl.dart';
import 'package:bip39/bip39.dart' as bip39;

class ImportWalletPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<ImportWalletPage> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  String _data = '';

  _import() {
    var _form = _formKey.currentState;
    if (_form.validate()) {
      print(_data);
      var seed = bip39.mnemonicToSeedHex(_data);
      print(seed);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(CustomLocalizations.of(context)
            .getString(StringIds.importWalletTitle)),
        leading: new IconButton(
          tooltip: 'back',
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
          child: Column(
            children: <Widget>[
              Text(
                CustomLocalizations.of(context)
                    .getString(StringIds.importWalletInputHelper),
                style: Theme.of(context).textTheme.body2,
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                  key: _formKey,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: CustomLocalizations.of(context)
                          .getString(StringIds.importWalletInputHint),
                    ),
                    maxLines: 3,
                    autofocus: true,
                    validator: (value) {
                      if (value.isNotEmpty) {
                        _data = value;
                        if (!bip39.validateMnemonic(_data)) {
                          return CustomLocalizations.of(context)
                              .getString(StringIds.errorValidMnemonic);
                        }
                      } else {
                        return CustomLocalizations.of(context)
                            .getString(StringIds.errorEmptyInput);
                      }
                      return null;
                    },
                  )),
              const SizedBox(
                height: 30,
              ),
              RaisedButton(
                padding: const EdgeInsets.fromLTRB(60, 5, 60, 5),
                child: Text(
                  CustomLocalizations.of(context)
                      .getString(StringIds.importWalletTitle),
                  style: Theme.of(context).textTheme.button,
                ),
                onPressed: _import,
              ),
              FlatButton(
                child: Text(
                    CustomLocalizations.of(context)
                        .getString(StringIds.scanQRCodeButton),
                    style: Theme.of(context).textTheme.body1),
                onPressed: () {},
              )
            ],
          )),
    );
  }
}
