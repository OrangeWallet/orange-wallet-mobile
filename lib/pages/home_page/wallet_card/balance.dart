import 'package:flutter/material.dart';

class BalanceWidget extends StatelessWidget {
  final String balance;

  BalanceWidget(this.balance);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text.rich(
          TextSpan(children: [
            TextSpan(
              text: balance,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 26),
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
  }
}
