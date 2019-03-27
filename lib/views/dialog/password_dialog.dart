import 'package:flutter/material.dart';

class PasswordDialog extends Dialog {
  final ValueChanged<String> okClick;

  PasswordDialog({Key key, @required this.okClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

    String _pwd = '';

    _sendPwd() {
      var _form = _formKey.currentState;
      if (_form.validate()) {
        okClick(_pwd);
      }
    }

    return Material(
      type: MaterialType.transparency,
      child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Wrap(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
                      child: Form(
                        key: _formKey,
                        child: TextFormField(
                          maxLength: 6,
                          maxLines: 1,
                          keyboardType: TextInputType.number,
                          autofocus: true,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        FlatButton(
                          child: Text('取消'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        FlatButton(
                          child: Text('确定'),
                          onPressed: _sendPwd,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
