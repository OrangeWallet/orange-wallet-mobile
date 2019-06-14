import 'package:OrangeWallet/contant/constant.dart';
import 'package:ckbcore/ckbcore_bean.dart';

class BalanceAllBean extends BalanceBean {
  BalanceDisplay totalForDisplay;
  BalanceDisplay availableForDisplay;

  BalanceAllBean(BalanceBean balance) : super(balance.totalCapacity, balance.availableCapacity) {
    totalForDisplay = handleBalance(balance.totalCapacity);
    availableForDisplay = handleBalance(balance.availableCapacity);
  }
}

BalanceDisplay handleBalance(int balance) {
  double balanceDouble = balance / 100000000;
  if (balanceDouble > 1000000000) {
    balanceDouble = balanceDouble / 1000000000;
    return BalanceDisplay(balanceDouble.toStringAsFixed(2), ckgbUnit);
  } else if (balanceDouble > 1000000) {
    balanceDouble = balanceDouble / 1000000;
    return BalanceDisplay(balanceDouble.toStringAsFixed(2), ckmbUnit);
  } else if (balanceDouble > 1000) {
    balanceDouble = balanceDouble / 1000;
    return BalanceDisplay(balanceDouble.toStringAsFixed(2), ckkbUnit);
  } else {
    return BalanceDisplay(balanceDouble.toStringAsFixed(2), ckbUnit);
  }
}

class BalanceDisplay {
  final String balance;
  final String uint;

  BalanceDisplay(this.balance, this.uint);
}
