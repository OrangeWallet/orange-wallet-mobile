import 'package:flutter/material.dart';

class CellsSyncProvider with ChangeNotifier {
  double _synced;

  CellsSyncProvider({double synced}) {
    _synced = synced;
  }

  double get synced => _synced;

  set synced(double synced) {
    _synced = synced;
    notifyListeners();
  }
}
