import 'package:flutter/material.dart';
import 'package:ckbalance/utils/wallet_manager.dart';
import 'package:ckbalance/utils/shared_preferences.dart';
import 'package:ckbalance/resources/shared_preferences_keys.dart';
import 'package:ckbalance/pages/home_page/leading_button.dart';

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
        leading: LeadingButton(),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            color: Theme.of(context).accentColor,
            onPressed: () {},
          )
        ],
      ),
      body: Center(
        child: Text(WalletManager.getInstance().getMasterPrivateKey()),
      ),
    );
  }
}
