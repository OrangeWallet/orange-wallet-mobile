import 'package:bip39/bip39.dart' as bip39;
import 'package:ckbalance/resources/strings.dart';
import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';

import 'package:ckbalance/views/button/my_raised_button.dart';

class MnemonicField extends StatefulWidget {
  final ValueSetter<String> handleMnemonic;
  final String buttonText;
  final ValueGetter<String> validate;
  final ValueSetter<String> onChanged;

  MnemonicField({@required this.handleMnemonic, this.buttonText, this.validate, this.onChanged});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<MnemonicField> {
  final TextEditingController _controller = new TextEditingController();
  String errorMsg;

  _handle() {
    String validate = _validate();
    if (validate != null) {
      setState(() {
        errorMsg = validate;
      });
    } else {
      widget.handleMnemonic(_controller.text);
    }
  }

  _validate() {
    final value = _controller.text;
    if (value.isEmpty)
      return CustomLocalizations.of(context).getString(StringIds.errorEmptyInput);
    else if (!bip39.validateMnemonic(value))
      return CustomLocalizations.of(context).getString(StringIds.errorValidMnemonic);
    else if (widget.validate != null) {
      String parentValidate = widget.validate();
      if (parentValidate != null) return parentValidate;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    _controller.addListener(() {
      widget.onChanged(_controller.text);
    });
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
      child: Column(
        children: <Widget>[
          Text(
            CustomLocalizations.of(context).getString(StringIds.importWalletInputHelper),
            style: Theme.of(context).textTheme.body2,
          ),
          const SizedBox(
            height: 30,
          ),
          TextField(
            controller: _controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText:
                    CustomLocalizations.of(context).getString(StringIds.importWalletInputHint),
                errorText: errorMsg),
            maxLines: 3,
            autofocus: true,
          ),
          const SizedBox(
            height: 30,
          ),
          MyRaisedButton(
            text: widget.buttonText == null
                ? CustomLocalizations.of(context).getString(StringIds.importWalletTitle)
                : widget.buttonText,
            onPressed: _handle,
          ),
        ],
      ),
    );
  }
}
