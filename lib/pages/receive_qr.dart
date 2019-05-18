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
    String blake160 = wallet.blake160;
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
                  padding: EdgeInsets.only(left: 50, right: 50, top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Address:'),
                      SizedBox(height: 5),
                      GestureDetector(
                        child: Text(address),
                        onLongPress: () {
                          Clipboard.setData(new ClipboardData(text: address));
                          key.currentState.showSnackBar(new SnackBar(
                            content: new Text(CustomLocalizations.of(context)
                                .getString(StringIds.copyToClipboard)),
                          ));
                        },
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 50, right: 50, top: 15, bottom: 35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('blake160:'),
                      SizedBox(height: 5),
                      GestureDetector(
                        child: Text(blake160),
                        onLongPress: () {
                          Clipboard.setData(new ClipboardData(text: blake160));
                          key.currentState.showSnackBar(new SnackBar(
                            content: new Text(CustomLocalizations.of(context)
                                .getString(StringIds.copyToClipboard)),
                          ));
                        },
                      )
                    ],
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
