import 'package:OrangeWallet/resources/strings.dart';
import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';

class NetTypeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        CustomLocalizations.of(context).getString(StringIds.testNet),
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
