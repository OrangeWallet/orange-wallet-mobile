import 'package:OrangeWallet/utils/provide/home_float_button_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';

class SemiCircleDoubleButton extends StatelessWidget {
  final String leftText;
  final String rightText;
  final VoidCallback leftClick;
  final VoidCallback rightClick;

  SemiCircleDoubleButton({
    @required this.leftText,
    @required this.leftClick,
    @required this.rightText,
    @required this.rightClick,
  });

  @override
  Widget build(BuildContext context) {
    final currentShow = Provide.value<HomeFloatButtonProvider>(context);
    return StreamBuilder<HomeFloatButtonProvider>(
      initialData: currentShow,
      stream: Provide.stream<HomeFloatButtonProvider>(context),
      builder: (context, floatShow) {
        if (floatShow.data.show) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                  ),
                  shape: BoxShape.rectangle,
                  color: Theme.of(context).primaryColor,
                ),
                child: FlatButton(
                  onPressed: leftClick,
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.call_received,
                        color: Colors.white,
                      ),
                      SizedBox(width: 5),
                      Container(
                        alignment: Alignment.center,
                        width: 70,
                        height: 40,
                        child: Text(
                          leftText,
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                indent: 0.5,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  shape: BoxShape.rectangle,
                  color: Theme.of(context).primaryColor,
                ),
                child: FlatButton(
                  onPressed: rightClick,
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.call_made,
                        color: Colors.white,
                      ),
                      SizedBox(width: 5),
                      Container(
                        alignment: Alignment.center,
                        width: 70,
                        height: 40,
                        child: Text(
                          rightText,
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
