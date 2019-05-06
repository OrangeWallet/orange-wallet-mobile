import 'package:flutter/material.dart';

class BalanceSyncProvider with ChangeNotifier {
  double _synced;

  BalanceSyncProvider({double synced}) {
    _synced = synced;
  }

  double get synced => _synced;

  set synced(double synced) {
    _synced = synced;
    notifyListeners();
  }
}
