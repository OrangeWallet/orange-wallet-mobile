import 'package:flutter/material.dart';
import 'package:fluintl/fluintl.dart';
import 'package:ckbalance/resources/strings.dart';

class NetTypeWidget extends StatelessWidget {
  final int netType;

  NetTypeWidget(this.netType);
  
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.fromLTRB(0, 5, 5, 0),
        child: GestureDetector(
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                )),
            padding: const EdgeInsets.fromLTRB(7, 2, 7, 2),
            child: Text(
              _getNetTypeText(context),
              style:
                  TextStyle(fontSize: 12, color: Theme.of(context).accentColor),
            ),
          ),
          onTap: () {
            showDialog(
                context: context, builder: (_) => _netTypeDialog(context));
          },
        ));
  }

  _getNetTypeText(BuildContext context) {
    if (netType == 0) {
      return CustomLocalizations.of(context).getString(StringIds.mainNet);
    }
    return CustomLocalizations.of(context).getString(StringIds.testNet);
  }

  _netTypeDialog(BuildContext context) {
    return AlertDialog(
      title: Text(CustomLocalizations.of(context).getString(StringIds.alert)),
      content:
          Text(CustomLocalizations.of(context).getString(StringIds.mainNetTip)),
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
