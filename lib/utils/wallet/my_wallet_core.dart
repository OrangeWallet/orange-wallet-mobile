import 'package:OrangeWallet/resources/shared_preferences_keys.dart';
import 'package:OrangeWallet/utils/provide/blocks_notifier.dart';
import 'package:OrangeWallet/utils/provide/cells_sync_notifier.dart';
import 'package:OrangeWallet/utils/provide/import_animation_notifier.dart';
import 'package:OrangeWallet/utils/shared_preferences.dart';
import 'package:OrangeWallet/utils/wallet/wallet_store.dart';
import 'package:ckbcore/base/bean/thin_block.dart';
import 'package:ckbcore/base/exception/exception.dart';
import 'package:ckbcore/base/utils/log.dart';
import 'package:ckbcore/ckbcore.dart';

class MyWalletCore extends WalletCore {
  static MyWalletCore _myWalletCore;
  ImportAnimationProvider currentLoading;
  CellsSyncProvider cellsSyncProvider;
  BlocksProvider blocksProvider;

  MyWalletCore._(String storePath) : super(storePath, 'http://192.168.2.78:8114', true);

  static MyWalletCore getInstance({String walletStorePath}) {
    if (_myWalletCore == null) {
      _myWalletCore = MyWalletCore._(walletStorePath);
    }
    return _myWalletCore;
  }

  Future<bool> hasWallet() async {
    return await WalletStore.getInstance().has();
  }

  // check the password right
  Future<bool> checkPwd(String password) async {
    try {
      await WalletStore.getInstance().read(password);
      return true;
    } catch (_) {
      return false;
    }
  }

  Future createFinished(bool isBackup) async {
    SpUtil spUtil = await SpUtil.getInstance();
    spUtil.putBool(SpKeys.backup, isBackup);
  }

  Future deleteWallet() async {
    await WalletStore.getInstance().delete();
    await super.clearStore();
  }

  @override
  updateCurrentIndexCells() async {
    cellsSyncProvider.synced = 0.0;
    super.updateCurrentIndexCells();
  }

  @override
  createStep(int step) {
    if (currentLoading == null) {
      throw Exception('Please set Provide first');
    }
    currentLoading.currentLoading = step;
  }

  @override
  syncedFinished() {
    Log.log('synced finished');
    if (cellsSyncProvider == null) {
      throw Exception('Please set Provide first');
    }
    cellsSyncProvider.synced = 1.0;
  }

  @override
  blockChanged(ThinBlock thinBlock) {
    if (blocksProvider == null) {
      throw Exception('Please set Provide first');
    }
    blocksProvider.addThinBlock(thinBlock);
  }

  @override
  cellsChanged() {
    Log.log('cells size ${cellsResultBean.cells.length}');
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
    if (cellsSyncProvider == null) {
      throw Exception('Please set Provide first');
    }
    cellsSyncProvider.synced = processing;
  }

  @override
  exception(Exception e) {
    if (e is SyncException) {
      if (cellsSyncProvider == null) {
        throw Exception('Please set Provide first');
      }
      cellsSyncProvider.synced = -1.0;
    } else if (e is BlockUpdateException) {}
  }
}
