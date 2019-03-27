import 'package:flutter/material.dart';
import '../views/dialog/loading_overlay.dart';
import '../utils/wallet_manager.dart';

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: RaisedButton(
        child: Text('Test'),
        onPressed: () async {
          LoadingOverlay.show(context: context);
          await WalletManager.getInstance().fromStore('1qaz.2wsx');
          LoadingOverlay.dismiss();
          print('123');
        },
      ),
    ));
  }
}
