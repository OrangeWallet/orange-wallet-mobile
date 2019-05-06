import 'package:flutter/material.dart';

class BalanceWidget extends StatelessWidget {
  final String balance;

  BalanceWidget(this.balance);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        SizedBox(width: 15),
        Text.rich(
          TextSpan(children: [
            TextSpan(
              text: balance,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 10, fontSize: 45),
            ),
            TextSpan(
              text: 'CKB',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                letterSpacing: 2,
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
