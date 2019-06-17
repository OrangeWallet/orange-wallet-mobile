import 'package:OrangeWallet/pages/home_page/home.dart';
import 'package:OrangeWallet/pages/import_wallet.dart';
import 'package:OrangeWallet/pages/import_wallet_loading.dart';
import 'package:OrangeWallet/resources/strings.dart';
import 'package:OrangeWallet/utils/wallet/my_wallet_core.dart';
import 'package:OrangeWallet/views/button/my_raised_button.dart';
import 'package:OrangeWallet/views/loading.dart';
import 'package:OrangeWallet/views/password_field.dart';
import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';

class InputRePasswordPage extends StatefulWidget {
  final String pwd;
  final String data;
  final ImportType type;

  InputRePasswordPage({@required this.pwd, @required this.data, @required this.type});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<InputRePasswordPage> {
  bool isLoading = false;
  final GlobalKey<FormFieldState<String>> _passwordFieldKey = GlobalKey<FormFieldState<String>>();
  final key = new GlobalKey<ScaffoldState>();

  String _validatePassword(String value) {
    final FormFieldState<String> passwordField = _passwordFieldKey.currentState;
    if (passwordField.value == null || passwordField.value.isEmpty)
      return CustomLocalizations.of(context).getString(StringIds.errorEmptyPwd);
    if (passwordField.value.length < 8)
      return CustomLocalizations.of(context).getString(StringIds.errorLessPwd);
    if (passwordField.value != widget.pwd)
      return CustomLocalizations.of(context).getString(StringIds.errorDiffPwd);
    return null;
  }

  _handlePwd() async {
    final FormFieldState<String> passwordField = _passwordFieldKey.currentState;
    if (passwordField.validate()) {
      if (widget.data == '') {
        MyWalletCore.getInstance().initWalletFromCreate(widget.pwd);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => ImportWalletLoading()),
            (Route route) => route == null);
      } else {
        if (widget.type == ImportType.Keystore) {
          setState(() {
            isLoading = true;
          });
          try {
            await MyWalletCore.getInstance().initWalletFromImportKeystore(widget.pwd, widget.data);
            MyWalletCore.getInstance().startSync();
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (BuildContext context) => HomePage()),
                (Route route) => route == null);
          } catch (_) {
            setState(() {
              isLoading = false;
            });
            key.currentState.showSnackBar(new SnackBar(
              content: new Text(
                  CustomLocalizations.of(context).getString(StringIds.importKeystoreFailed)),
            ));
          }
        } else {
          MyWalletCore.getInstance().initWalletFromImportPrivateKey(widget.pwd, widget.data);
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (BuildContext context) => ImportWalletLoading()),
              (Route route) => route == null);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
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
      body: isLoading
          ? WillPopScope(child: Loading(), onWillPop: () {})
          : Container(
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
                    labelText:
                        CustomLocalizations.of(context).getString(StringIds.inputPwdFieldLabel),
                    helperText:
                        CustomLocalizations.of(context).getString(StringIds.inputPwdFieldHelper),
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
                        text: CustomLocalizations.of(context).getString(StringIds.nextButton),
                        onPressed: _handlePwd),
                  ),
                ],
              )),
    );
  }
}
