import 'dart:typed_data';

import 'package:OrangeWallet/bean/wallet_store_bean.dart';
import 'package:OrangeWallet/contant/constant.dart' as Constant;
import 'package:OrangeWallet/contant/constant.dart';
import 'package:OrangeWallet/utils/provide/balance_notifier.dart';
import 'package:OrangeWallet/utils/provide/blocks_notifier.dart';
import 'package:OrangeWallet/utils/provide/cells_sync_notifier.dart';
import 'package:OrangeWallet/utils/provide/import_animation_notifier.dart';
import 'package:OrangeWallet/utils/wallet/init_wallet_utils.dart' as InitWalletUtils;
import 'package:OrangeWallet/utils/wallet/wallet_store.dart';
import 'package:ckb_sdk/ckb_crypto.dart';
import 'package:ckbcore/ckbcore.dart';
import 'package:ckbcore/ckbcore_bean.dart';
import 'package:convert/convert.dart';
import 'package:flutter/foundation.dart';

class MyWalletCore extends WalletCore {
  static MyWalletCore _myWalletCore;
  WalletStore _walletStore;
  Uint8List _privateKey;
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

  Uint8List get privateKey => _privateKey;

  Future initWalletFromStore(String password) async {
    WalletStoreBean walletStoreBean = await _walletStore.read(password);
    await importWallet(hex.decode(walletStoreBean.publicKey));
    startSync();
  }

  initWalletFromCreate(String password) async {
    Uint8List privateKey = await createWallet();
    currentLoading.currentLoading = 1;
    String publicKey = hex.encode(publicKeyFromPrivate(privateKey));
    Keystore keystore = await compute(InitWalletUtils.createNew,
        InitWalletUtils.KeystoreParams(password, privateKey: privateKey));
    _privateKey = keystore.privateKey;
    currentLoading.currentLoading = 2;
    WalletStoreBean walletStoreBean =
        WalletStoreBean(publicKey, await compute(InitWalletUtils.keystoreToJson, keystore));
    _walletStore.write(walletStoreBean, password);
    currentLoading.currentLoading = 3;
  }

  initWalletFromImportPrivateKey(String password, String privateKey) async {
    currentLoading.currentLoading = 1;
    Keystore myKeystore = await compute(InitWalletUtils.createNew,
        InitWalletUtils.KeystoreParams(password, privateKey: hex.decode(privateKey)));
    _privateKey = myKeystore.privateKey;
    currentLoading.currentLoading = 2;
    String publicKey = hex.encode(publicKeyFromPrivate(myKeystore.privateKey));
    WalletStoreBean walletStoreBean =
        WalletStoreBean(publicKey, await compute(InitWalletUtils.keystoreToJson, myKeystore));
    _walletStore.write(walletStoreBean, password);
    importWallet(hex.decode(publicKey));
    currentLoading.currentLoading = 3;
  }

  Future initWalletFromImportKeystore(String password, String keystore) async {
    Keystore myKeystore = await compute(
        InitWalletUtils.fromJson, InitWalletUtils.KeystoreParams(password, keystore: keystore));
    _privateKey = myKeystore.privateKey;
    String publicKey = hex.encode(publicKeyFromPrivate(myKeystore.privateKey));
    WalletStoreBean walletStoreBean = WalletStoreBean(publicKey, keystore);
    importWallet(hex.decode(publicKey));
    _walletStore.write(walletStoreBean, password);
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
    if (_privateKey == null) {
      WalletStoreBean walletStoreBean = await getWalletStore(password);
      Keystore keystore = await compute(InitWalletUtils.fromJson,
          InitWalletUtils.KeystoreParams(password, keystore: walletStoreBean.keystore));
      _privateKey = keystore.privateKey;
    }
    return await sendCapacity(receivers, network, _privateKey);
  }

  @override
  startSync() async {
    cellsSyncProvider.synced = 0.0;
    super.startSync();
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
    Log.log(e.toString());
    cellsSyncProvider.synced = -1.0;
  }
}
