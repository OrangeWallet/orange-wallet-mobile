import 'package:OrangeWallet/resources/shared_preferences_keys.dart';
import 'package:OrangeWallet/utils/shared_preferences.dart';
import 'package:flutter/material.dart';

class BackupProvider with ChangeNotifier {
  bool _backup;

  BackupProvider({backup: false}) {
    _backup = backup;
  }

  bool get backup => _backup;

  set backup(bool backup) {
    _backup = backup;
    notifyListeners();
  }

  Future change(bool backup) async {
    _backup = backup;
    final spUtil = await SpUtil.getInstance();
    await spUtil.putBool(SpKeys.backup, backup);
    notifyListeners();
  }
}
