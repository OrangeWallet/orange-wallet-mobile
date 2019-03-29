import 'package:flutter/material.dart';

import 'backup.dart';
import 'balance.dart';
import 'net_type_button.dart';

class WalletCardWidget extends StatelessWidget {
  final int netType;
  final bool backup;
  final String balance;

  WalletCardWidget(this.netType, this.backup, this.balance);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            theme.primaryColor,
            theme.primaryColorLight,
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
                SizedBox(height: 10),
                BalanceWidget(balance),
                SizedBox(height: 13),
                BackupWidget(backup),
                SizedBox(height: 7)
              ],
            ),
            Column(
              children: <Widget>[
                NetTypeWidget(netType),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    'images/ic_nervos.png',
                    height: 50,
                  ),
                )
              ],
            )
          ],
        ));
  }
}
