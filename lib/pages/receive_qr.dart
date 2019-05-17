import 'package:OrangeWallet/contant/constant.dart';
import 'package:OrangeWallet/resources/strings.dart';
import 'package:OrangeWallet/utils/wallet/my_wallet_core.dart';
import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ReceiveQr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final key = new GlobalKey<ScaffoldState>();
    final wallet = MyWalletCore.getInstance().myWallet;
    String address = wallet.getAddress(network);
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
