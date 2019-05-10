import 'package:ckbcore/base/bean/balance_bean.dart';
import 'package:flutter/material.dart';

class BalanceProvider with ChangeNotifier {
  BalanceBean _balanceBean;

  BalanceProvider(this._balanceBean);

  BalanceBean get balance => _balanceBean;

  set balance(BalanceBean balanceBean) {
    _balanceBean = balanceBean;
    notifyListeners();
  }
}
