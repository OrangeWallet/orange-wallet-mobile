import 'package:flutter/material.dart';

class HomeFloatButtonProvider with ChangeNotifier {
  bool _show;

  HomeFloatButtonProvider({show: true}) {
    _show = show;
  }

  bool get show => _show;

  set show(bool show) {
    _show = show;
    notifyListeners();
  }
}
