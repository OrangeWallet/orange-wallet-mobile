import 'package:OrangeWallet/pages/home_page/home.dart';
import 'package:OrangeWallet/utils/provide/import_animation_notifier.dart';
import 'package:OrangeWallet/utils/wallet/my_wallet_core.dart';
import 'package:OrangeWallet/views/button/my_raised_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provide/provide.dart';
import 'package:fluintl/fluintl.dart';
import 'package:OrangeWallet/resources/strings.dart';

class ImportWalletLoading extends StatelessWidget {
  static double _iconSize = 40.0;
  static double _iconWaitSize = 30.0;
  static double _iconMarginLeft = 80.0;
  static double _textMargin = 25.0;
  static double _lineWidth = 2.0;
  static double _lineMargin = (_iconSize - _lineWidth) / 2;
  static double _lineHeight = 80.0;
  static int totalStep = 3;

  @override
  Widget build(BuildContext context) {
    final currentLoading = Provide.value<ImportAnimationProvider>(context);
    return StreamBuilder<ImportAnimationProvider>(
      initialData: currentLoading,
      stream: Provide.stream<ImportAnimationProvider>(context),
      builder: (context, snapshot) {
        List<String> _list = [
          CustomLocalizations.of(context).getString(StringIds.importAnimFirst),
          CustomLocalizations.of(context).getString(StringIds.importAnimSecond),
          CustomLocalizations.of(context).getString(StringIds.importAnimThird),
        ];
        List<Widget> stepList = List();
        stepList.addAll(_list.map((title) {
          return buildStep(context, title, _list.indexOf(title), snapshot.data.currentLoading);
        }));
        stepList.add(buildButton(context, snapshot.data.currentLoading));
        bool notNull(Object o) => o != null;
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: Container(
            margin: const EdgeInsets.only(top: 40),
            child: Column(
              children: stepList.where(notNull).toList(),
            ),
          ),
        );
      },
    );
  }

  Widget buildStep(BuildContext context, String title, int step, int current) {
    if (step < current) {
      return buildFinishStep(context, step, title);
    } else if (step == current) {
      return buildLoadStep(context, step, title);
    } else {
      return buildWaitStep(context, step, title);
    }
  }

  Widget buildFinishStep(BuildContext context, int step, String text) {
    ThemeData theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(left: _iconMarginLeft),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: _iconSize,
                height: _iconSize,
                child: Icon(
                  Icons.cloud_done,
                  size: _iconSize,
                  color: theme.primaryColor,
                ),
              ),
              SizedBox(
                width: _textMargin,
              ),
              Text(
                text,
                style:
                    TextStyle(color: theme.primaryColor, fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
          buildVerLine(context, step, theme.primaryColor)
        ],
      ),
    );
  }

  Widget buildLoadStep(BuildContext context, int step, String text) {
    ThemeData theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(left: _iconMarginLeft),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: _iconSize,
                height: _iconSize,
                padding: const EdgeInsets.all(3),
                child: SpinKitHourGlass(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(
                width: _textMargin,
              ),
              Text(
                text,
                style: TextStyle(color: theme.primaryColor, fontSize: 20),
              )
            ],
          ),
          buildVerLine(context, step, Colors.grey)
        ],
      ),
    );
  }

  Widget buildWaitStep(BuildContext context, int step, String text) {
    return Container(
      margin: EdgeInsets.only(left: _iconMarginLeft),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: _iconSize,
                height: _iconSize,
                child: Icon(
                  Icons.cloud_download,
                  size: _iconWaitSize,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                width: _textMargin,
              ),
              Text(
                text,
                style: TextStyle(color: Colors.grey, fontSize: 20),
              )
            ],
          ),
          buildVerLine(context, step, Colors.grey)
        ],
      ),
    );
  }

  Widget buildVerLine(BuildContext context, int step, Color lineColor) {
    return step + 1 == totalStep
        ? Container(
            margin: EdgeInsets.only(left: _lineMargin),
            width: _lineWidth,
          )
        : Container(
            margin: EdgeInsets.only(left: _lineMargin),
            width: _lineWidth,
            height: _lineHeight,
            color: lineColor,
          );
  }

  Widget buildButton(BuildContext context, int current) {
    return current >= totalStep
        ? Container(
            margin: const EdgeInsets.only(top: 50),
            child: MyRaisedButton(
              padding: const EdgeInsets.only(left: 100, right: 100),
              text: CustomLocalizations.of(context).getString(StringIds.start),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                MyWalletCore.getInstance().startSync();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (BuildContext context) => HomePage()),
                    (Route route) => route == null);
              },
            ),
          )
        : Container();
  }
}
