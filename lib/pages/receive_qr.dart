import 'package:OrangeWallet/resources/strings.dart';
import 'package:OrangeWallet/utils/provide/net_type_notifier.dart';
import 'package:OrangeWallet/utils/wallet/wallet_manager.dart';
import 'package:ckb_sdk/ckb-utils/network.dart';
import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provide/provide.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ReceiveQr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final key = new GlobalKey<ScaffoldState>();
    final netType = Provide.value<NetTypeProvider>(context);
    final wallet = WalletManager.getInstance().walletCore.unusedChangeWallet;
    String address = wallet.getAddress(netType.type == 0 ? Network.MainNet : Network.TestNet);
    return Scaffold(
      key: key,
      appBar:
          AppBar(title: Text(CustomLocalizations.of(context).getString(StringIds.receiveAddress))),
      body: Center(
        child: Wrap(
          children: <Widget>[
            Column(
              children: <Widget>[
                QrImage(
                  data: address,
                  size: 230.0,
                ),
                Container(
                  padding: EdgeInsets.only(left: 50, right: 50, top: 15, bottom: 35),
                  child: new GestureDetector(
                    child: new Text(address),
                    onLongPress: () {
                      Clipboard.setData(new ClipboardData(text: address));
                      key.currentState.showSnackBar(new SnackBar(
                        content: new Text(
                            CustomLocalizations.of(context).getString(StringIds.copyToClipboard)),
                      ));
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
