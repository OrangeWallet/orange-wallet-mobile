import 'package:OrangeWallet/utils/provide/balance_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';

class BalanceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final balanceProvider = Provide.value<BalanceProvider>(context);
    return StreamBuilder<BalanceProvider>(
      stream: Provide.stream<BalanceProvider>(context),
      initialData: balanceProvider,
      builder: (context, provider) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text.rich(
              TextSpan(children: [
                TextSpan(
                  text: provider.data.balance.totalCapacity.toStringAsPrecision(3),
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
                ),
                TextSpan(
                  text: ' CKB',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ]),
            ),
          ],
        );
      },
    );
  }
}
