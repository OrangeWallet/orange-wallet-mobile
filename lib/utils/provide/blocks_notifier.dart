import 'package:OrangeWallet/bean/thin_block_with_transaction.dart';
import 'package:OrangeWallet/contant/constant.dart';
import 'package:ckbcore/base/bean/thin_block.dart';
import 'package:flutter/material.dart';

class BlocksProvider with ChangeNotifier {
  List<ThinBlockWithTransaction> _thinBlocks;
  List<ThinBlockWithTransaction> _thinBlocksWithTrans;
  bool _onlyShowBlocksWithTransaction;

  BlocksProvider() {
    _thinBlocks = [];
    _thinBlocksWithTrans = [];
    _onlyShowBlocksWithTransaction = true;
  }

  List<ThinBlock> get thinBlocks =>
      _onlyShowBlocksWithTransaction ? _thinBlocksWithTrans : _thinBlocks;

  bool get onlyShowBlocksWithTransaction => _onlyShowBlocksWithTransaction;

  addThinBlock(ThinBlock thinBlock) {
    _thinBlocks.insert(0, ThinBlockWithTransaction(thinBlock));
    if (_thinBlocks.length > maxThinBlocksSize) _thinBlocks.removeLast();
    if (thinBlock.thinTrans.length > 0) {
      _thinBlocksWithTrans.insert(0, ThinBlockWithTransaction(thinBlock));
      if (_thinBlocksWithTrans.length > maxThinBlocksSize) _thinBlocksWithTrans.removeLast();
    }
    notifyListeners();
  }

  changeDisplay(bool onlyTransaction) {
    _onlyShowBlocksWithTransaction = onlyTransaction;
    notifyListeners();
  }

  clearThinBlock() {
    _thinBlocks = [];
    notifyListeners();
  }
}
