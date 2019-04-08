import 'package:flutter/material.dart';

class MyRaisedButton extends StatelessWidget {
  const MyRaisedButton(
      {Key key,
      @required this.text,
      @required this.onPressed,
      this.padding,
      this.color,
      this.fontColor: Colors.white})
      : super(key: key);

  final String text;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry padding;
  final Color color;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: padding == null ? const EdgeInsets.fromLTRB(60, 5, 60, 5) : padding,
      color: color != null ? color : Theme.of(context).primaryColor,
      child: Text(
        text,
        style: Theme.of(context).textTheme.button.copyWith(color: fontColor),
      ),
      onPressed: onPressed,
    );
  }
}
