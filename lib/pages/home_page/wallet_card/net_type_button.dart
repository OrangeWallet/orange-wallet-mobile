import 'package:OrangeWallet/contant/constant.dart';
import 'package:OrangeWallet/resources/strings.dart';
import 'package:ckb_sdk/ckb-utils/network.dart';
import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';

class NetTypeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            )),
        padding: const EdgeInsets.fromLTRB(7, 2, 7, 2),
        child: buildNetType(context),
      ),
      onTap: () {
        showDialog(context: context, builder: (_) => _netTypeDialog(context));
      },
    );
  }

  Widget buildNetType(BuildContext context) {
    String typeStr;
    if (network == Network.MainNet) {
      typeStr = CustomLocalizations.of(context).getString(StringIds.mainNet);
    } else {
      typeStr = CustomLocalizations.of(context).getString(StringIds.testNet);
    }
    return Text(
      typeStr,
      style: TextStyle(fontSize: 12, color: Theme.of(context).primaryColor),
    );
  }

  _netTypeDialog(BuildContext context) {
    return AlertDialog(
      title: Text(CustomLocalizations.of(context).getString(StringIds.alert)),
      content: Text(CustomLocalizations.of(context).getString(StringIds.mainNetTip)),
      actions: <Widget>[
        FlatButton(
          child: Text(CustomLocalizations.of(context).getString(StringIds.ok)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
