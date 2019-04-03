import 'package:flutter/material.dart';

class ThemeColorProvider with ChangeNotifier {
  Color _color;

  ThemeColorProvider({color: Colors.blue}) {
    _color = color;
  }

  Color get color => _color;

  set color(Color color) {
    _color = color;
    notifyListeners();
  }
}
