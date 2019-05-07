import 'package:OrangeWallet/resources/strings.dart';
import 'package:OrangeWallet/utils/provide/cells_sync_notifier.dart';
import 'package:OrangeWallet/utils/wallet/my_wallet_core.dart';
import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';

class SyncProgressing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final balanceSync = Provide.value<CellsSyncProvider>(context);
    return StreamBuilder<CellsSyncProvider>(
        initialData: balanceSync,
        stream: Provide.stream<CellsSyncProvider>(context),
        builder: (context, balanceSync) {
          return balanceSync.data.synced >= 0
              ? Row(
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
                )
              : GestureDetector(
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.refresh,
                        color: Colors.white,
                        size: 15,
                      ),
                      SizedBox(width: 5),
                      Text(CustomLocalizations.of(context).getString(StringIds.errorSync),
                          style: TextStyle(color: Colors.white, fontSize: 16))
                    ],
                  ),
                  onTap: () {
                    MyWalletCore.getInstance().updateCurrentIndexCells();
                  },
                );
        });
  }
}
