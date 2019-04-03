import 'package:OrangeWallet/utils/provide/backup_notifier.dart';
import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';

import 'package:OrangeWallet/pages/create_import.dart';
import 'package:OrangeWallet/pages/home_page/home.dart';
import 'package:OrangeWallet/resources/strings.dart';
import 'package:OrangeWallet/utils/wallet/wallet_manager.dart';
import 'package:OrangeWallet/views/button/my_raised_button.dart';
import 'package:OrangeWallet/views/password_field.dart';
import 'package:provide/provide.dart';

class CheckPasswordPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<CheckPasswordPage> {
  final GlobalKey<FormFieldState<String>> _passwordFieldKey = GlobalKey<FormFieldState<String>>();
  String errorMsg;

  Future<bool> _validatePassword() async {
    String msg = "";
    final FormFieldState<String> passwordField = _passwordFieldKey.currentState;
    if (passwordField.value == null || passwordField.value.isEmpty)
      msg = CustomLocalizations.of(context).getString(StringIds.errorEmptyPwd);
    else if (passwordField.value.length < 8)
      msg = CustomLocalizations.of(context).getString(StringIds.errorLessPwd);
    else if (!await WalletManager.getInstance().checkPwd(passwordField.value))
      msg = CustomLocalizations.of(context).getString(StringIds.errorDiffPwd);
    if (msg != '') {
      setState(() {
        errorMsg = msg;
      });
      return false;
    }
    return true;
  }

  _handlePwd() async {
    final FormFieldState<String> passwordField = _passwordFieldKey.currentState;
    if (await _validatePassword()) {
      await WalletManager.getInstance().fromStore(passwordField.value);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => HomePage()),
          (Route route) => route == null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(CustomLocalizations.of(context).getString(StringIds.inputPwdTitle)),
      ),
      body: Container(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
          child: Column(
            children: <Widget>[
              Text(
                CustomLocalizations.of(context).getString(StringIds.inputPwdTip),
                style: Theme.of(context).textTheme.body2,
              ),
              const SizedBox(
                height: 30,
              ),
              PasswordField(
                fieldKey: _passwordFieldKey,
                labelText: CustomLocalizations.of(context).getString(StringIds.inputPwdFieldLabel),
                helperText:
                    CustomLocalizations.of(context).getString(StringIds.inputPwdFieldHelper),
                errorText: errorMsg,
                autofocus: true,
                onFieldSubmitted: (value) {
                  _handlePwd();
                },
              ),
              const SizedBox(
                height: 30,
              ),
              MyRaisedButton(
                  text: CustomLocalizations.of(context).getString(StringIds.nextButton),
                  onPressed: _handlePwd),
              FlatButton(
                child: Text(CustomLocalizations.of(context).getString(StringIds.forgetPwd),
                    style: Theme.of(context).textTheme.body1),
                onPressed: _showForgetAlert,
              )
            ],
          )),
    );
  }

  _showForgetAlert() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
            title: Text(CustomLocalizations.of(context).getString(StringIds.alert)),
            content: Text(CustomLocalizations.of(context).getString(StringIds.forgetDialogContent)),
            actions: <Widget>[
              FlatButton(
                child: Text(CustomLocalizations.of(context).getString(StringIds.tryAgain)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text(CustomLocalizations.of(context).getString(StringIds.deleteWallet)),
                onPressed: () {
                  Navigator.of(context).pop();
                  _showDeleteWallet();
                },
              ),
            ],
          ),
    );
  }

  _showDeleteWallet() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
            title: Text(CustomLocalizations.of(context).getString(StringIds.alert)),
            content: Text(
                CustomLocalizations.of(context).getString(StringIds.deleteWalletDialogContent)),
            actions: <Widget>[
              FlatButton(
                child: Text(CustomLocalizations.of(context).getString(StringIds.tryAgain)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text(CustomLocalizations.of(context).getString(StringIds.deleteWallet)),
                onPressed: () async {
                  WalletManager.getInstance().deleteStore();
                  await Provide.value<BackupProvider>(context).change(true);
                  Navigator.of(context).pop();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (BuildContext context) => CreateImportPage()),
                      (Route route) => route == null);
                },
              )
            ],
          ),
    );
  }
}
