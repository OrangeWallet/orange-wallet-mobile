import 'package:flutter/material.dart';
import 'package:OrangeWallet/views/password_field.dart';
import 'package:OrangeWallet/resources/strings.dart';
import 'package:fluintl/fluintl.dart';
import 'package:OrangeWallet/utils/wallet/wallet_manager.dart';
import 'package:OrangeWallet/views/button/my_raised_button.dart';

class PasswordBottomSheet extends StatefulWidget {
  final ValueChanged<String> okClick;

  PasswordBottomSheet(this.okClick);

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<PasswordBottomSheet> {
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
      Navigator.of(context).pop();
      widget.okClick(passwordField.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        Container(
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Theme.of(context).accentColor, width: 1)),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(CustomLocalizations.of(context).getString(StringIds.inputPwdTitle),
                      style: Theme.of(context).textTheme.display1),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
                  child: PasswordField(
                    fieldKey: _passwordFieldKey,
                    labelText:
                        CustomLocalizations.of(context).getString(StringIds.inputPwdFieldLabel),
                    helperText:
                        CustomLocalizations.of(context).getString(StringIds.inputPwdFieldHelper),
                    errorText: errorMsg,
                    autofocus: true,
                    onFieldSubmitted: (value) {
                      _handlePwd();
                    },
                  ),
                ),
                MyRaisedButton(
                  text: CustomLocalizations.of(context).getString(StringIds.ok),
                  onPressed: _handlePwd,
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ))
      ],
    );
  }
}
