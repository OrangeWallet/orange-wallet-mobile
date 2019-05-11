import 'dart:convert';

import 'package:OrangeWallet/contant/constant.dart' as Constant;
import 'package:OrangeWallet/utils/provide/balance_notifier.dart';
import 'package:OrangeWallet/utils/provide/blocks_notifier.dart';
import 'package:OrangeWallet/utils/provide/cells_sync_notifier.dart';
import 'package:OrangeWallet/utils/provide/import_animation_notifier.dart';
import 'package:OrangeWallet/utils/wallet/wallet_store.dart';
import 'package:ckbcore/base/bean/balance_bean.dart';
import 'package:ckbcore/base/bean/thin_block.dart';
import 'package:ckbcore/base/config/hd_core_config.dart';
import 'package:ckbcore/base/utils/log.dart';
import 'package:ckbcore/ckbcore.dart';
import 'package:flutter/widgets.dart';

class MyWalletCore extends WalletCore {
  static MyWalletCore _myWalletCore;
  ImportAnimationProvider currentLoading;
  CellsSyncProvider cellsSyncProvider;
  BlocksProvider blocksProvider;
  BalanceProvider balanceProvider;

  MyWalletCore._(String storePath) : super(storePath, Constant.nodeUrl, true);

  static MyWalletCore getInstance({String walletStorePath}) {
    if (_myWalletCore == null) {
      _myWalletCore = MyWalletCore._(walletStorePath);
    }
    return _myWalletCore;
  }

  initWallet({@required String password, String mnemonic, bool fromStore = false}) async {
    if (fromStore) {
      await super.init(password);
    } else if (mnemonic == null) {
      await super.create(password);
    } else {
      await super.import(mnemonic, password);
    }
    updateCurrentIndexCells();
  }

  Future<bool> hasWallet() async {
    return await WalletStore.getInstance().has();
  }

  // check the password right
  Future<bool> checkPwd(String password) async {
    try {
      String data = await WalletStore.getInstance().read(password);
      HDCoreConfig.fromJson(jsonDecode(data));
      return true;
    } catch (_) {
      return false;
    }
  }

  Future deleteWallet() async {
    await WalletStore.getInstance().delete();
    await super.clearStore();
  }

  Future resetBlockChain() async {
    await MyWalletCore.getInstance().stopSync();
    await MyWalletCore.getInstance().clearStore();
    blocksProvider.clearThinBlock();
    balanceProvider.balance = BalanceBean(0, 0);
    MyWalletCore.getInstance().updateCurrentIndexCells();
  }

  @override
  updateCurrentIndexCells() async {
    cellsSyncProvider.synced = 0.0;
    try {
      super.updateCurrentIndexCells();
    } catch (e) {
      cellsSyncProvider.synced = -1.0;
    }
  }

  @override
  createStep(int step) {
    currentLoading.currentLoading = step;
  }

  @override
  cellsChanged(BalanceBean balance) {
    balanceProvider.balance = balance;
  }

  @override
  blockChanged(ThinBlock thinBlock) {
    blocksProvider.addThinBlock(thinBlock);
  }

  @override
  Future<String> readWallet(String password) async {
    return await WalletStore.getInstance().read(password);
  }

  @override
  Future writeWallet(String wallet, String password) async {
    await WalletStore.getInstance().write(wallet, password);
  }

  @override
  syncProcess(double processing) {
    cellsSyncProvider.synced = processing;
  }

  @override
  syncException(Exception e) {
    Log.log(e.toString());
    cellsSyncProvider.synced = -1.0;
  }
}
