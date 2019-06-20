import 'package:flutter/material.dart';

class LoadingDialog extends Dialog {
  final VoidCallback pressBack;

  LoadingDialog(this.pressBack);

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
                width: 70,
                height: 70,
                padding: const EdgeInsets.all(10),
                child: CircularProgressIndicator(
                  strokeWidth: 2,
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
