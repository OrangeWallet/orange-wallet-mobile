import 'package:ckbalance/utils/provide/net_type_notifier.dart';
import 'package:flutter/material.dart';
import 'package:fluintl/fluintl.dart';
import 'package:ckbalance/resources/strings.dart';
import 'package:provide/provide.dart';

class NetTypeWidget extends StatelessWidget {
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
            child: buildNetType(context),
          ),
          onTap: () {
            showDialog(context: context, builder: (_) => _netTypeDialog(context));
          },
        ));
  }

  Widget buildNetType(BuildContext context) {
    final currentNetType = Provide.value<NetTypeProvider>(context);
    return StreamBuilder<NetTypeProvider>(
      initialData: currentNetType,
      stream: Provide.stream<NetTypeProvider>(context),
      builder: (context, netType) {
        String typeStr;
        if (netType.data.type == 0) {
          typeStr = CustomLocalizations.of(context).getString(StringIds.mainNet);
        }
        typeStr = CustomLocalizations.of(context).getString(StringIds.testNet);
        return Text(
          typeStr,
          style: TextStyle(fontSize: 12, color: Theme.of(context).primaryColor),
        );
      },
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
