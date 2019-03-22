import 'package:flutter/material.dart';
import 'package:ckbalance/utils/shared_preferences.dart';
import 'package:ckbalance/resources/shared_preferences_keys.dart';
import 'package:ckbalance/pages/home_page/wallet_card/wallet_card.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<HomePage> {
  SpUtil spUtil;
  int netType;

  @override
  void initState() {
    super.initState();
    getNetType();
  }

  getNetType() async {
    spUtil = await SpUtil.getInstance();
    netType = spUtil.getInt(SharedPreferencesKeys.netType, 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'CKBalance',
            style: Theme.of(context).textTheme.title,
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.more_horiz),
              color: Theme.of(context).accentColor,
              onPressed: () {},
            )
          ],
        ),
        body: Container(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: WalletCardWidget(),
              )
            ],
          ),
        ));
  }
}
