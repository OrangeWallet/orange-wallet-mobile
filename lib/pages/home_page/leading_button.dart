import 'package:flutter/material.dart';
import 'package:ckbalance/utils/shared_preferences.dart';
import 'package:ckbalance/resources/shared_preferences_keys.dart';

class LeadingButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<LeadingButton> {
  SpUtil spUtil;
  int netType = 1;

  @override
  void initState() {
    super.initState();
    getNetType();
  }

  getNetType() async {
    spUtil = await SpUtil.getInstance();
    int spType = spUtil.getInt(SharedPreferencesKeys.netType, 1);
    setState(() {
      netType = spType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          getIcon(),
          color: Theme.of(context).accentColor,
        ),
        Text(
          getText(),
          style: TextStyle(
              fontSize: 10, color: Colors.black38, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  getText() {
    if (netType == 0) {
      return 'Main Net';
    }
    return 'Test Net';
  }

  getIcon() {
    if (netType == 0) {
      return Icons.wb_sunny;
    }
    return Icons.wb_cloudy;
  }
}
