import 'package:OrangeWallet/pages/home_page/wallet_card/backup.dart';
import 'package:OrangeWallet/pages/home_page/wallet_card/balance.dart';
import 'package:OrangeWallet/pages/home_page/wallet_card/net_type_button.dart';
import 'package:OrangeWallet/pages/home_page/wallet_card/sync_progressing.dart';
import 'package:flutter/material.dart';

class WalletCardWidget extends StatelessWidget {
  final String balance;

  WalletCardWidget(this.balance);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [theme.primaryColor, theme.accentColor, theme.primaryColorLight],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        padding: const EdgeInsets.all(10),
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SyncProgressing(),
                BalanceWidget(balance),
                SizedBox(height: 15),
                BackupWidget(),
                SizedBox(height: 15)
              ],
            ),
            Column(
              children: <Widget>[
                NetTypeWidget(),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 25, 20, 0),
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
