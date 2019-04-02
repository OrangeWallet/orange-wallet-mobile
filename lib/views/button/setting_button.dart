import 'package:flutter/material.dart';

class SettingButton extends StatelessWidget {
  final IconData iconData;
  final String text;
  final VoidCallback onClick;

  SettingButton({key, @required this.iconData, @required this.text, @required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          InkWell(
            child: Column(
              children: <Widget>[
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    SizedBox(width: 20),
                    Icon(
                      iconData,
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(text),
                    )
                  ],
                ),
                SizedBox(height: 5),
              ],
            ),
            onTap: onClick,
          ),
          Divider()
        ],
      ),
    );
  }
}
