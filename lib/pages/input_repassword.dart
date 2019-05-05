import 'package:OrangeWallet/pages/import_wallet_loading.dart';
import 'package:OrangeWallet/resources/strings.dart';
import 'package:OrangeWallet/utils/provide/import_animation_notifier.dart';
import 'package:OrangeWallet/utils/wallet/my_wallet_core.dart';
import 'package:OrangeWallet/views/button/my_raised_button.dart';
import 'package:OrangeWallet/views/password_field.dart';
import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';

class InputRePasswordPage extends StatefulWidget {
  final String pwd;
  final String mnemonic;

  InputRePasswordPage(this.pwd, {this.mnemonic = ""});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<InputRePasswordPage> {
  final GlobalKey<FormFieldState<String>> _passwordFieldKey = GlobalKey<FormFieldState<String>>();

  String _validatePassword(String value) {
    final FormFieldState<String> passwordField = _passwordFieldKey.currentState;
    if (passwordField.value == null || passwordField.value.isEmpty)
      return CustomLocalizations.of(context).getString(StringIds.errorEmptyPwd);
    if (passwordField.value.length < 8) return CustomLocalizations.of(context).getString(StringIds.errorLessPwd);
    if (passwordField.value != widget.pwd) return CustomLocalizations.of(context).getString(StringIds.errorDiffPwd);
    return null;
  }

  _handlePwd() {
    final FormFieldState<String> passwordField = _passwordFieldKey.currentState;
    if (passwordField.validate()) {
      MyWalletCore.getInstance().currentLoading = Provide.value<ImportAnimationProvide>(context);
      MyWalletCore.getInstance().create(widget.mnemonic, widget.pwd);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => ImportWalletLoading()), (Route route) => route == null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(CustomLocalizations.of(context).getString(StringIds.inputPwdTitle)),
        leading: new IconButton(
          tooltip: 'back',
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                CustomLocalizations.of(context).getString(StringIds.inputPwdReTip),
                style: Theme.of(context).textTheme.body2,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                CustomLocalizations.of(context).getString(StringIds.inputPwdReAttention),
                style: Theme.of(context).textTheme.body1.copyWith(color: Colors.red),
              ),
              const SizedBox(
                height: 20,
              ),
              PasswordField(
                fieldKey: _passwordFieldKey,
                labelText: CustomLocalizations.of(context).getString(StringIds.inputPwdFieldLabel),
                helperText: CustomLocalizations.of(context).getString(StringIds.inputPwdFieldHelper),
                validator: _validatePassword,
                autofocus: true,
                onFieldSubmitted: (value) {
                  _handlePwd();
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: MyRaisedButton(
                    text: CustomLocalizations.of(context).getString(StringIds.nextButton), onPressed: _handlePwd),
              ),
            ],
          )),
    );
  }
}
