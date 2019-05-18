import 'package:flutter/material.dart';

class ImportAnimationProvider with ChangeNotifier {
  int _currentLoading;

  ImportAnimationProvider({currentLoading: 0}) {
    _currentLoading = currentLoading;
  }

  int get currentLoading => _currentLoading;

  set currentLoading(int currentLoading) {
    _currentLoading = currentLoading;
    notifyListeners();
  }
}
