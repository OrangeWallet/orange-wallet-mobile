import 'dart:math';
import 'dart:typed_data';

import 'package:OrangeWallet/bean/wallet_store_bean.dart';
import 'package:OrangeWallet/contant/constant.dart' as Constant;
import 'package:OrangeWallet/contant/constant.dart';
import 'package:OrangeWallet/utils/provide/balance_notifier.dart';
import 'package:OrangeWallet/utils/provide/blocks_notifier.dart';
import 'package:OrangeWallet/utils/provide/cells_sync_notifier.dart';
import 'package:OrangeWallet/utils/provide/import_animation_notifier.dart';
import 'package:OrangeWallet/utils/wallet/wallet_store.dart';
import 'package:ckb_sdk/ckb_crypto.dart';
import 'package:ckbcore/ckbcore.dart';
import 'package:ckbcore/ckbcore_bean.dart';
import 'package:convert/convert.dart';
import 'package:flutter/foundation.dart';
import 'package:OrangeWallet/utils/wallet/init_wallet_utils.dart' as InitWalletUtils;

class MyWalletCore extends WalletCore {
  static MyWalletCore _myWalletCore;
  WalletStore _walletStore;
  ImportAnimationProvider currentLoading;
  CellsSyncProvider cellsSyncProvider;
  BlocksProvider blocksProvider;
  BalanceProvider balanceProvider;

  MyWalletCore._(String storePath) : super(storePath, Constant.nodeUrl, Constant.network, true) {
    _walletStore = WalletStore();
  }

  static MyWalletCore getInstance({String walletStorePath}) {
    if (_myWalletCore == null) {
      _myWalletCore = MyWalletCore._(walletStorePath);
    }
    return _myWalletCore;
  }

  Future initWalletFromStore(String password) async {
    WalletStoreBean walletStoreBean = await _walletStore.read(password);
    await importWallet(hex.decode(walletStoreBean.publicKey));
  }

  initWalletFromCreate(String password) async {
    Uint8List privateKey = await createWallet();
    currentLoading.currentLoading = 1;
    String publicKey = hex.encode(publicKeyFromPrivate(privateKey));
    Keystore keystore = await compute(InitWalletUtils.createNew,
        InitWalletUtils.KeystoreParams(password, privateKey: privateKey));
    currentLoading.currentLoading = 2;
    WalletStoreBean walletStoreBean =
        WalletStoreBean(publicKey, await compute(InitWalletUtils.keystoreToJson, keystore));
    _walletStore.write(walletStoreBean, password);
    currentLoading.currentLoading = 3;
  }

  initWalletFromImport(String password, String keystore, String privateKey) async {
    currentLoading.currentLoading = 1;
    Keystore myKeystore;
    if (keystore == null) {
      myKeystore = Keystore.fromJson(keystore, password);
    } else {
      myKeystore = Keystore.createNew(hex.decode(privateKey), password, Random.secure());
    }
    currentLoading.currentLoading = 2;
    String publicKey = hex.encode(publicKeyFromPrivate(myKeystore.privateKey));
    WalletStoreBean walletStoreBean = WalletStoreBean(publicKey, myKeystore.toJson());
    await _walletStore.write(walletStoreBean, password);
    currentLoading.currentLoading = 3;
  }

  Future<bool> hasWallet() async {
    return await _walletStore.has();
  }

  // check the password right
  Future<bool> checkPwd(String password) async {
    try {
      await _walletStore.read(password);
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<WalletStoreBean> getWalletStore(String password) async {
    WalletStoreBean walletStoreBean = await _walletStore.read(password);
    return walletStoreBean;
  }

  Future deleteWallet() async {
    await _walletStore.delete();
    await super.clearStore();
  }

  Future resetBlockChain() async {
    await MyWalletCore.getInstance().stopSync();
    await MyWalletCore.getInstance().clearStore();
    blocksProvider.clearThinBlock();
    balanceProvider.balance = BalanceBean(0, 0);
    MyWalletCore.getInstance().startSync();
  }

  Future<String> transfer(List<ReceiverBean> receivers, String password) async {
    WalletStoreBean walletStoreBean = await getWalletStore(password);
    Keystore keystore = await compute(InitWalletUtils.fromJson,
        InitWalletUtils.KeystoreParams(password, keystore: walletStoreBean.keystore));
    return await sendCapacity(receivers, network, keystore.privateKey);
  }

  @override
  startSync() async {
    cellsSyncProvider.synced = 0.0;
    try {
      super.startSync();
    } catch (e) {
      cellsSyncProvider.synced = -1.0;
    }
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
  syncProcess(double processing) {
    cellsSyncProvider.synced = processing;
  }

  @override
  syncException(Exception e) {
    print(e.toString());
    cellsSyncProvider.synced = -1.0;
  }
}
