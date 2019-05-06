import 'package:OrangeWallet/utils/provide/balance_sync_notifier.dart';
import 'package:OrangeWallet/utils/wallet/my_wallet_core.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';

class SyncProgressing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final balanceSync = Provide.value<BalanceSyncProvider>(context);
    MyWalletCore.getInstance().balanceSync = balanceSync;
    return StreamBuilder<BalanceSyncProvider>(
        initialData: balanceSync,
        stream: Provide.stream<BalanceSyncProvider>(context),
        builder: (context, balanceSync) {
          return Row(
            children: <Widget>[
              SizedBox(
                  height: 15,
                  width: 15,
                  child: balanceSync.data.synced >= 1.0
                      ? Container()
                      : CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        )),
              SizedBox(width: 5),
              balanceSync.data.synced >= 1.0
                  ? Container()
                  : Text(
                      (balanceSync.data.synced * 100).toInt().toString() + "%",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
            ],
          );
        });
  }
}
