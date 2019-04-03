import 'package:ckbalance/pages/home_page/wallet_card/backup.dart';
import 'package:ckbalance/pages/home_page/wallet_card/balance.dart';
import 'package:ckbalance/pages/home_page/wallet_card/net_type_button.dart';
import 'package:flutter/material.dart';

class WalletCardWidget extends StatelessWidget {
  final String balance;

  WalletCardWidget(this.balance);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
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
                BackupWidget(),
                SizedBox(height: 7)
              ],
            ),
            Column(
              children: <Widget>[
                NetTypeWidget(),
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
