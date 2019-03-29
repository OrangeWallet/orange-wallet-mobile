import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';

import 'package:ckbalance/resources/strings.dart';
import 'package:ckbalance/views/button/my_raised_button.dart';
import 'package:ckbalance/pages/confirm_mnemonic.dart';

class BackupMnemonic extends StatelessWidget {
  final String _mnemonic;

  BackupMnemonic(this._mnemonic);

  @override
  Widget build(BuildContext context) {
    List<String> words = _mnemonic.split(" ");
    List<String> wordsLeft = List(words.length ~/ 2);
    List<String> wordsRight = List(words.length ~/ 2);
    for (int i = 0; i < words.length; i++) {
      if (i < words.length ~/ 2) {
        wordsLeft[i] = words[i];
      } else {
        wordsRight[i - words.length ~/ 2] = words[i];
      }
    }
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
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: Theme.of(context).accentColor, width: 1)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  wordColumn(wordsLeft, 1),
                  SizedBox(width: 15),
                  wordColumn(wordsRight, wordsLeft.length + 1),
                ],
              ),
            ),
            SizedBox(height: 30),
            MyRaisedButton(
              padding: const EdgeInsets.fromLTRB(90, 10, 90, 10),
              text: CustomLocalizations.of(context).getString(StringIds.nextButton),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) => ConfirmMnemonic()));
              },
            )
          ],
        ),
      ),
    );
  }

  Widget wordColumn(List<String> words, int start) {
    return Container(
      height: 200,
      width: 120,
      child: ListView.builder(
          itemCount: words.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.only(left: 10, bottom: 10),
              child: Text(
                start + index > 9
                    ? '${start + index}  ' + words[index]
                    : '${start + index}    ' + words[index],
                style: TextStyle(fontSize: 20),
              ),
            );
          }),
    );
  }
}
