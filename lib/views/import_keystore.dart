import 'package:OrangeWallet/pages/home_page/home.dart';
import 'package:OrangeWallet/resources/strings.dart';
import 'package:OrangeWallet/utils/wallet/my_wallet_core.dart';
import 'package:OrangeWallet/views/button/my_raised_button.dart';
import 'package:OrangeWallet/views/dialog/loading_dialog.dart';
import 'package:OrangeWallet/views/loading.dart';
import 'package:OrangeWallet/views/password_field.dart';
import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';

class ImportKeystore extends StatefulWidget {
  @override
  State<ImportKeystore> createState() => _State();
}

class _State extends State<ImportKeystore> {
  String keystore;
  String password;
  bool isLoading = false;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _validatePassword(String value) {
    if (value == null || value.isEmpty)
      return CustomLocalizations.of(context).getString(StringIds.errorEmptyPwd);
    if (value.length < 8) return CustomLocalizations.of(context).getString(StringIds.errorLessPwd);
    return null;
  }

  _handle() async {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      showDialog(
          context: context,
          builder: (_) =>
              LoadingDialog(() {}, CustomLocalizations.of(context).getString(StringIds.importing)));
      try {
        await MyWalletCore.getInstance().initWalletFromImportKeystore(password, keystore);
        MyWalletCore.getInstance().startSync();
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => HomePage()),
            (Route route) => route == null);
      } catch (_) {
        Navigator.of(context).pop();
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(CustomLocalizations.of(context).getString(StringIds.alert)),
                  content: Text(
                      CustomLocalizations.of(context).getString(StringIds.importKeystoreFailed)),
                  actions: <Widget>[
                    FlatButton(
                      child: Text(CustomLocalizations.of(context).getString(StringIds.ok)),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? WillPopScope(child: Loading(), onWillPop: () {})
        : Container(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
            child: Column(
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: CustomLocalizations.of(context)
                              .getString(StringIds.inputKeystoreLabel),
                        ),
                        maxLines: 5,
                        autofocus: true,
                        validator: (value) {
                          if (value.isEmpty)
                            return CustomLocalizations.of(context)
                                .getString(StringIds.errorEmptyInput);
                        },
                        onSaved: (value) => keystore = value,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      PasswordField(
                        labelText: CustomLocalizations.of(context)
                            .getString(StringIds.inputKeystorePasswordLabel),
                        autofocus: false,
                        validator: (value) => _validatePassword(value),
                        onSaved: (value) => password = value,
                        onFieldSubmitted: (_) => _handle(),
                      ),
                    ],
                  ),
                ),
                MyRaisedButton(
                  text: CustomLocalizations.of(context).getString(StringIds.importWalletTitle),
                  onPressed: _handle,
                ),
              ],
            ));
  }
}
