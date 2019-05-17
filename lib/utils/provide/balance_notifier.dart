import 'package:OrangeWallet/bean/balance_all_bean.dart';
import 'package:ckbcore/base/bean/balance_bean.dart';
import 'package:flutter/material.dart';

class BalanceProvider with ChangeNotifier {
  int shannon = 100000000;
  BalanceAllBean _balanceAll;

  BalanceProvider(BalanceBean baseBalance) {
    _balanceAll = BalanceAllBean(baseBalance);
  }

  BalanceAllBean get balance => _balanceAll;

  set balance(BalanceBean baseBalance) {
    _balanceAll = BalanceAllBean(baseBalance);
    notifyListeners();
  }
}
