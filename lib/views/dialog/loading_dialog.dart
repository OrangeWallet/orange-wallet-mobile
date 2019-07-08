import 'package:flutter/material.dart';

class LoadingDialog extends Dialog {
  final VoidCallback pressBack;
  final String content;

  LoadingDialog(this.pressBack, this.content);

  @override
  Widget get child => WillPopScope(
        child: Center(
          child: Wrap(
            children: <Widget>[
              Container(
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                ),
                width: 110,
                height: 110,
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                        width: 60,
                        height: 60,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    content == ''
                        ? Container()
                        : Text(
                            content + "...",
                            style: TextStyle(fontSize: 14),
                          )
                  ],
                ),
              ),
            ],
          ),
        ),
        onWillPop: pressBack,
      );

  @override
  Color get backgroundColor => Colors.transparent;

  @override
  double get elevation => 0;
}
