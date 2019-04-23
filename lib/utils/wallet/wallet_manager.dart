import 'dart:async';
import 'dart:typed_data';

import 'package:OrangeWallet/bean/wallet_store_bean.dart';
import 'package:OrangeWallet/resources/shared_preferences_keys.dart';
import 'package:OrangeWallet/utils/provide/import_animation_notifier.dart';
import 'package:OrangeWallet/utils/shared_preferences.dart';
import 'package:OrangeWallet/utils/wallet/utils/isolate_mnemonic_to_seed.dart';
import 'package:OrangeWallet/utils/wallet/wallet_store.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:ckbcore/ckbcore.dart';
import 'package:convert/convert.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';

class WalletManager {
  static WalletManager _manager;
  WalletStoreBean _walletStoreBean;
  WalletCore walletCore;

  WalletManager._();

  static WalletManager getInstance() {
    if (_manager == null) {
      _manager = WalletManager._();
    }
    return _manager;
  }

  // if mnemonic is empty,creating a new wallet.otherwise import from mnemonic
  Future importWallet(BuildContext context, String mnemonic, String password) async {
    final currentLoading = Provide.value<ImportAnimationProvide>(context);
    SpUtil spUtil = await SpUtil.getInstance();
    bool isImport = false;
    if (mnemonic == '') {
      mnemonic = bip39.generateMnemonic();
      spUtil.putBool(SpKeys.backup, false);
    } else {
      isImport = true;
      spUtil.putBool(SpKeys.backup, true);
    }
    Uint8List seed = await MnemonicToSeedIsolate.loadData(mnemonic);
    currentLoading.currentLoading = 1;
    if (isImport) {
      walletCore = WalletCore.fromImport(seed);
    } else {
      walletCore = WalletCore.fromCreate(seed);
    }
    _walletStoreBean = WalletStoreBean(mnemonic, hex.encode(seed),
        walletCore.unusedReceiveWallet.index, walletCore.unusedChangeWallet.index);
    currentLoading.currentLoading = 2;
    await WalletStore.getInstance().write(_walletStoreBean, password);
    currentLoading.currentLoading = 3;
    return;
  }

  Future fromStore(String password) async {
    _walletStoreBean = await WalletStore.getInstance().read(password);
    walletCore = await WalletCore.fromStore(hex.decode(_walletStoreBean.seed),
        _walletStoreBean.receiveIndex, _walletStoreBean.receiveIndex);
  }

  String getMnemonic() {
    return _walletStoreBean.mnemonic;
  }

  // check the password right
  Future<bool> checkPwd(String password) async {
    try {
      _walletStoreBean = await WalletStore.getInstance().read(password);
      return bip39.validateMnemonic(_walletStoreBean.mnemonic);
    } catch (_) {
      return false;
    }
  }

  // check the wallet stored
  Future<bool> hasWallet() async {
    return await WalletStore.getInstance().has();
  }

  deleteStore() {
    WalletStore.getInstance().delete();
  }
}
