import 'package:OrangeWallet/bean/balance_all_bean.dart';
import 'package:OrangeWallet/contant/constant.dart';
import 'package:ckbcore/base/bean/balance_bean.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  int shannon = 100000000;

  test('CKB', () {
    BalanceBean balance = BalanceBean(100 * shannon, 90 * shannon);
    BalanceAllBean balanceAll = BalanceAllBean(balance);
    expect(balanceAll.totalForDisplay.balance, '100.00');
    expect(balanceAll.totalForDisplay.uint, CKBUnit);
    expect(balanceAll.availableForDisplay.balance, '90.00');
    expect(balanceAll.availableForDisplay.uint, CKBUnit);
  });

  test('CKKB', () {
    BalanceBean balance = BalanceBean(10000 * shannon, 900 * shannon);
    BalanceAllBean balanceAll = BalanceAllBean(balance);
    expect(balanceAll.totalForDisplay.balance, '10.00');
    expect(balanceAll.totalForDisplay.uint, CKKBUnit);
    expect(balanceAll.availableForDisplay.balance, '900.00');
    expect(balanceAll.availableForDisplay.uint, CKBUnit);
  });

  test('CKMB', () {
    BalanceBean balance = BalanceBean(10000000 * shannon, 900000 * shannon);
    BalanceAllBean balanceAll = BalanceAllBean(balance);
    expect(balanceAll.totalForDisplay.balance, '10.00');
    expect(balanceAll.totalForDisplay.uint, CKMBUnit);
    expect(balanceAll.availableForDisplay.balance, '900.00');
    expect(balanceAll.availableForDisplay.uint, CKKBUnit);
  });

  test('CKGB', (){
    BalanceBean balance = BalanceBean(10000000000 * shannon, 900000000 * shannon);
    BalanceAllBean balanceAll = BalanceAllBean(balance);
    expect(balanceAll.totalForDisplay.balance, '10.00');
    expect(balanceAll.totalForDisplay.uint, CKGBUnit);
    expect(balanceAll.availableForDisplay.balance, '900.00');
    expect(balanceAll.availableForDisplay.uint, CKMBUnit);
  });
}
