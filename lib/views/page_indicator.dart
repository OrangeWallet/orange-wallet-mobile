import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  final int count;
  final int currentIndex;
  final Color normalColor;
  final Color selectColor;
  final double width;
  final double height;
  final double padding;

  PageIndicator({
    Key key,
    @required this.count,
    @required this.normalColor,
    @required this.selectColor,
    @required this.currentIndex,
    this.width: 8.0,
    this.height: 8.0,
    this.padding: 8.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width * count + padding * (count + 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: getChildren(),
      ),
    );
  }

  List<Widget> getChildren() {
    List<Widget> children = [];
    for (int i = 0; i < count; i++) {
      var colorVal = (i == currentIndex ? this.selectColor : this.normalColor);
      children.add(GestureDetector(
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: colorVal,
            shape: BoxShape.circle,
          ),
        ),
      ));
    }
    return children;
  }
}
