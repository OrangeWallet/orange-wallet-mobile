import 'package:OrangeWallet/pages/home_page/wallet_card/wallet_card.dart';
import 'package:OrangeWallet/pages/setting_page/settings.dart';
import 'package:flutter/material.dart';
import 'package:fluintl/fluintl.dart';
import 'package:OrangeWallet/resources/strings.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            CustomLocalizations.of(context).getString(StringIds.appName),
            style: Theme.of(context).textTheme.title,
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.more_horiz),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => Settings()));
              },
            )
          ],
        ),
        body: Container(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: WalletCardWidget('0'),
              )
            ],
          ),
        ));
  }
}
