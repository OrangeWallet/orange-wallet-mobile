import 'package:ckbalance/utils/redux/store.dart';
import 'package:flutter/material.dart';
import 'package:ckbalance/utils/shared_preferences.dart';
import 'package:ckbalance/resources/shared_preferences_keys.dart';
import 'package:ckbalance/pages/home_page/wallet_card/wallet_card.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ckbalance/utils/redux/reducer/primary_swatch_reducer.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<HomePage> {
  SpUtil spUtil;
  int _netType = 1;
  bool _backup = false;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  _getData() async {
    spUtil = await SpUtil.getInstance();
    setState(() {
      _netType = spUtil.getInt(SharedPreferencesKeys.netType, 1);
      _backup = spUtil.getBool(SharedPreferencesKeys.backup, false);
    });
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
              color: Theme.of(context).primaryColor,
              onPressed: () {
                StoreProvider.of<AppState>(context)
                    .dispatch(PrimarySwatchAction(PrimarySwatchState(color: Colors.deepOrange)));
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
                child: WalletCardWidget(_netType, _backup, '0'),
              )
            ],
          ),
        ));
  }
}
