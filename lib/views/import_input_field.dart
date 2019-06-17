import 'package:OrangeWallet/resources/strings.dart';
import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';

import 'package:OrangeWallet/views/button/my_raised_button.dart';

class ImportInputField extends StatefulWidget {
  final ValueSetter<String> handle;
  final String buttonText;
  final ValueGetter<String> validate;
  final ValueSetter<String> onChanged;
  final String title;

  ImportInputField({
    @required this.handle,
    @required this.title,
    this.buttonText,
    this.validate,
    this.onChanged,
  });

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<ImportInputField> {
  final TextEditingController _controller = new TextEditingController();
  String errorMsg;

  _handle() {
    String validate = _validate();
    if (validate != null) {
      setState(() {
        errorMsg = validate;
      });
    } else {
      widget.handle(_controller.text);
    }
  }

  _validate() {
    final value = _controller.text;
    if (value.isEmpty)
      return CustomLocalizations.of(context).getString(StringIds.errorEmptyInput);
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
            widget.title,
            style: Theme.of(context).textTheme.body2,
          ),
          const SizedBox(
            height: 30,
          ),
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              errorText: errorMsg,
            ),
            maxLines: 5,
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
