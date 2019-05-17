import 'package:OrangeWallet/bean/balance_all_bean.dart';
import 'package:ckbcore/base/bean/thin_block.dart';

class ThinBlockWithTransaction extends ThinBlock {
  List<BalanceDisplay> thinTransDisplay;

  ThinBlockWithTransaction(ThinBlock thinBlock) : super(thinBlock.thinHeader, thinBlock.thinTrans) {
    thinTransDisplay = [];
    thinBlock.thinTrans.forEach((thinTransaction) {
      thinTransDisplay.add(handleBalance(thinTransaction.capacityIn - thinTransaction.capacityOut));
    });
  }
}
