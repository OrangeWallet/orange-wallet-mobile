import 'package:OrangeWallet/resources/strings.dart';
import 'package:OrangeWallet/views/button/my_raised_button.dart';
import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BackupKeystore extends StatelessWidget {
  final String keystore;

  BackupKeystore(this.keystore);

  @override
  Widget build(BuildContext context) {
    final key = new GlobalKey<ScaffoldState>();
    return Scaffold(
      key: key,
      appBar: AppBar(
        title: Text(CustomLocalizations.of(context).getString(StringIds.backedUp)),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.fromLTRB(20, 40, 20, 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Theme.of(context).accentColor, width: 1)),
            child: Text(keystore),
          ),
          MyRaisedButton(
            text: CustomLocalizations.of(context).getString(StringIds.copy),
            onPressed: () {
              Clipboard.setData(new ClipboardData(text: keystore));
              key.currentState.showSnackBar(new SnackBar(
                content:
                    new Text(CustomLocalizations.of(context).getString(StringIds.copyToClipboard)),
              ));
            },
          ),
        ],
      ),
    );
  }
}
