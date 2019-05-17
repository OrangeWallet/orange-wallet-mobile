import 'package:OrangeWallet/contant/constant.dart';
import 'package:ckbcore/base/bean/balance_bean.dart';

class BalanceAllBean extends BalanceBean {
  BalanceDisplay totalForDisplay;
  BalanceDisplay availableForDisplay;

  BalanceAllBean(BalanceBean balance) : super(balance.totalCapacity, balance.availableCapacity) {
    totalForDisplay = _handleBalance(balance.totalCapacity);
    availableForDisplay = _handleBalance(balance.availableCapacity);
  }

  BalanceDisplay _handleBalance(int balance) {
    double balanceDouble = balance / 100000000;
    if (balanceDouble > 1000000000) {
      balanceDouble = balanceDouble / 1000000000;
      return BalanceDisplay(balanceDouble.toStringAsFixed(2), CKGBUnit);
    } else if (balanceDouble > 1000000) {
      balanceDouble = balanceDouble / 1000000;
      return BalanceDisplay(balanceDouble.toStringAsFixed(2), CKMBUnit);
    } else if (balanceDouble > 1000) {
      balanceDouble = balanceDouble / 1000;
      return BalanceDisplay(balanceDouble.toStringAsFixed(2), CKKBUnit);
    } else {
      return BalanceDisplay(balanceDouble.toStringAsFixed(2), CKBUnit);
    }
  }
}

class BalanceDisplay {
  final String balance;
  final String uint;

  BalanceDisplay(this.balance, this.uint);
}
