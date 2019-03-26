import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:fluintl/fluintl.dart';
import 'package:ckbalance/resources/strings.dart';
import 'package:ckbalance/views/button/my_raised_button.dart';

// ignore: must_be_immutable
class BackupMnemonic extends StatelessWidget {
  final String _mnemonic;

  BackupMnemonic(this._mnemonic);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(CustomLocalizations.of(context).getString(StringIds.backedUp)),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Text(
                CustomLocalizations.of(context).getString(StringIds.backedUpTitle),
                style: Theme.of(context).textTheme.body2,
              ),
            ),
            SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: Theme.of(context).accentColor, width: 1)),
              child: Text(
                _mnemonic,
                style: TextStyle(fontSize: 18, wordSpacing: 8),
              ),
            ),
            SizedBox(height: 30),
            QrImage(
              data: _mnemonic,
              size: 200,
            ),
            SizedBox(height: 30),
            MyRaisedButton(
              padding: const EdgeInsets.fromLTRB(90, 10, 90, 10),
              text: CustomLocalizations.of(context).getString(StringIds.nextButton),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
