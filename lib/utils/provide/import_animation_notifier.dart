import 'package:flutter/material.dart';

class ImportAnimationProvide with ChangeNotifier {
  int _currentLoading;

  ImportAnimationProvide({currentLoading: 0}) {
    _currentLoading = currentLoading;
  }

  int get currentLoading => _currentLoading;

  set currentLoading(int currentLoading) {
    _currentLoading = currentLoading;
    notifyListeners();
  }
}
