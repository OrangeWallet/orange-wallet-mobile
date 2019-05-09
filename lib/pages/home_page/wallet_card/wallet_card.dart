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
      height: 150,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [theme.primaryColor, theme.accentColor, theme.primaryColorLight],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 5,
            left: 5,
            child: SyncProgressing(),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: BalanceWidget(balance),
          ),
          Positioned(
            left: 20,
            bottom: 20,
            child: BackupWidget(),
          ),
          Positioned(
            right: 15,
            bottom: 15,
            child: Image.asset(
              'images/ic_nervos.png',
              height: 50,
            ),
          ),
          Positioned(
            right: 15,
            top: 15,
            child: NetTypeWidget(),
          ),
        ],
      ),
    );
  }
}
