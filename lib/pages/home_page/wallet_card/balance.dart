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
                  text: provider.data.balance.totalForDisplay.balance,
                  style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white, fontSize: 36),
                ),
                TextSpan(
                  text: " " + provider.data.balance.totalForDisplay.uint,
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
