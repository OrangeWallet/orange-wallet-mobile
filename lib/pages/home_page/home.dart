import 'package:flutter/material.dart';
import 'package:ckbalance/utils/wallet_manager.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Flutter'),
      ),
      body: Center(
        child: Text(WalletManager.getInstance().getMasterPrivateKey()),
      ),
    );
  }
}
