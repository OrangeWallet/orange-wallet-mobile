import 'balance.dart';
import 'net_type_button.dart';
import 'backup.dart';
import 'package:flutter/material.dart';
import 'package:ckbalance/utils/shared_preferences.dart';
import 'package:ckbalance/resources/shared_preferences_keys.dart';

class WalletCardWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<WalletCardWidget> {
  int balance = 0;

  SpUtil spUtil;
  int netType = 1;

  @override
  void initState() {
    super.initState();
    _getNetType();
  }

  _getNetType() async {
    spUtil = await SpUtil.getInstance();
    setState(() {
      netType = spUtil.getInt(SharedPreferencesKeys.netType, 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            Colors.lightBlue,
            Colors.lightBlueAccent,
          ], begin: Alignment.topLeft),
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        padding: const EdgeInsets.all(10),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(height: 15),
                BalanceWidget(balance.toString()),
                SizedBox(height: 10),
                BackupWidget(true),
                SizedBox(height: 7)
              ],
            ),
            NetTypeWidget(netType),
          ],
        ));
  }
}
