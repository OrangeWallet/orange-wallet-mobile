import 'package:OrangeWallet/pages/home_page/block_display/block_display.dart';
import 'package:OrangeWallet/pages/home_page/wallet_card/wallet_card.dart';
import 'package:OrangeWallet/pages/receive_qr.dart';
import 'package:OrangeWallet/pages/setting_page/settings.dart';
import 'package:OrangeWallet/pages/transfer/transfer.dart';
import 'package:OrangeWallet/resources/strings.dart';
import 'package:OrangeWallet/views/button/semicircle_double_button.dart';
import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final key = new GlobalKey<ScaffoldState>();
    return Scaffold(
        key: key,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            CustomLocalizations.of(context).getString(StringIds.appName),
            style: Theme.of(context).textTheme.title,
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.more_horiz),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => Settings()));
              },
            ),
          ],
        ),
        floatingActionButton: Builder(
            builder: (BuildContext context) => SemiCircleDoubleButton(
                  leftText: CustomLocalizations.of(context).getString(StringIds.receive),
                  leftClick: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => ReceiveQr()));
                  },
                  rightText: CustomLocalizations.of(context).getString(StringIds.send),
                  rightClick: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => TransferPage()));
                  },
                )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: WillPosScopeRoute(
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        WalletCardWidget(),
                        SizedBox(height: 20),
                        BlockDisplay(),
                      ],
                    ),
                  )
                ],
              ),
            ),
            firstClick: () {
              key.currentState.showSnackBar(SnackBar(
                content: Text(CustomLocalizations.of(context).getString(StringIds.finishAppTip)),
              ));
            }));
  }
}

class WillPosScopeRoute extends StatefulWidget {
  final Widget child;
  final VoidCallback firstClick;

  WillPosScopeRoute({@required this.child, @required this.firstClick});

  @override
  _WillPosScopeRouteState createState() => _WillPosScopeRouteState();
}

class _WillPosScopeRouteState extends State<WillPosScopeRoute> {
  DateTime _lastPressedAdt;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: widget.child,
        onWillPop: () {
          if (_lastPressedAdt == null ||
              DateTime.now().difference(_lastPressedAdt) > Duration(seconds: 2)) {
            _lastPressedAdt = DateTime.now();
            widget.firstClick();
            return Future.value(false);
          } else {
            return Future.value(true);
          }
        });
  }
}
