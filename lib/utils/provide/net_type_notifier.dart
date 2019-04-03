import 'package:flutter/material.dart';

class NetTypeProvider with ChangeNotifier {
  // 0: main net 1: test net
  int _type;

  NetTypeProvider({type: 1}) {
    _type = type;
  }

  int get type => _type;

  set type(int type) {
    _type = type;
    notifyListeners();
  }
}
