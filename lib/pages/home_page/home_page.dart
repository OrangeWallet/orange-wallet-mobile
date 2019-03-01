import 'package:flutter/material.dart';
import 'package:fluintl/fluintl.dart';
import 'package:ckbalance/resources/strings.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Flutter'),
      ),
      body: Center(
        child:
            Text(CustomLocalizations.of(context).getString(StringIds.appName)),
      ),
    );
  }
}
