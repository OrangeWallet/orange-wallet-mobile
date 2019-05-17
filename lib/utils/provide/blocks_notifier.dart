import 'package:OrangeWallet/bean/thin_block_with_transaction.dart';
import 'package:OrangeWallet/contant/constant.dart';
import 'package:ckbcore/base/bean/thin_block.dart';
import 'package:flutter/material.dart';

class BlocksProvider with ChangeNotifier {
  List<ThinBlock> _thinBlocks;
  List<ThinBlockWithTransaction> _thinBlocksWithTrans;

  BlocksProvider() {
    _thinBlocks = [];
    _thinBlocksWithTrans = [];
  }

  List<ThinBlock> get thinBlocks => _thinBlocks;

  List<ThinBlockWithTransaction> get thinBlocksWithTrans => _thinBlocksWithTrans;

  addThinBlock(ThinBlock thinBlock) {
    _thinBlocks.insert(0, thinBlock);
    if (_thinBlocks.length > maxThinBlocksSize) _thinBlocks.removeLast();
    if (thinBlock.thinTrans.length > 0) {
      _thinBlocksWithTrans.insert(0, ThinBlockWithTransaction(thinBlock));
      if (_thinBlocksWithTrans.length > maxThinBlocksSize) _thinBlocksWithTrans.removeLast();
    }
    notifyListeners();
  }

  clearThinBlock() {
    _thinBlocks = [];
    notifyListeners();
  }
}
