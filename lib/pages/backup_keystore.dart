import 'package:OrangeWallet/resources/strings.dart';
import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';

class BackupKeystore extends StatelessWidget {
  final String keystore;

  BackupKeystore(this.keystore);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(CustomLocalizations.of(context).getString(StringIds.backedUp)),
      ),
      body: Container(
        child: Text(keystore),
      ),
    );
  }
}
