import 'package:flutter/material.dart';
import '../../../contant/constant.dart';


class NodeSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 15),
      child: TextField(
        keyboardType: TextInputType.url,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 18.0),
          labelText: ' Please input node url',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))
          )
        ),
      onSubmitted: (String val)  {
        nodeUrl = val;
        Navigator.of(context).pop();
      },
      ),
    );
  }
}