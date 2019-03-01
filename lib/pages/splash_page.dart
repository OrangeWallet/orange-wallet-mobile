import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ckbalance/pages/create_import_page/create_import_page.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _SpashState();
}

class _SpashState extends State<SplashPage> {
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (BuildContext context) => CreateImportPage()),
          (Route route) => route == null);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
          child: new Image.asset(
        'images/ic_launcher.png',
        width: 70,
        height: 70,
      )),
      backgroundColor: Colors.white,
    );
  }
}
