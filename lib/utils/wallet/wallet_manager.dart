import 'dart:async';
import 'dart:typed_data';

import 'package:bip32/bip32.dart' as bip32;
import 'package:bip39/bip39.dart' as bip39;
import 'package:convert/convert.dart';

import 'package:OrangeWallet/utils/shared_preferences.dart';
import 'package:OrangeWallet/utils/wallet/wallet_store.dart';
import 'package:OrangeWallet/bean/mnemonic_bean.dart';
import 'package:OrangeWallet/resources/shared_preferences_keys.dart';
import 'package:OrangeWallet/utils/wallet/utils/isolate_mnemonic_to_seed.dart';

class WalletManager {
  static WalletManager _manager;
  static bip32.BIP32 _node;
  final String _purpose = "44'";
  final String _coinType = "0'";
  static String _account = "0'";
  static int _external = 0;
  MnemonicBean _mnemonicBean;

  WalletManager._();

  static WalletManager getInstance() {
    if (_manager == null) {
      _manager = WalletManager._();
    }
    return _manager;
  }

  // if mnemonic is empty,creating a new wallet.otherwise import from mnemonic
  Future importWallet(String mnemonic, String password) async {
    SpUtil spUtil = await SpUtil.getInstance();
    if (mnemonic == '') {
      mnemonic = bip39.generateMnemonic();
      spUtil.putBool(SpKeys.backup, false);
    } else {
      spUtil.putBool(SpKeys.backup, true);
    }
    Uint8List seed = await MnemonicToSeedIsolate.loadData(mnemonic);
    _mnemonicBean = MnemonicBean(mnemonic, hex.encode(seed));
    _node = bip32.BIP32.fromSeed(seed);
    await WalletStore.getInstance().write(_mnemonicBean, password);
    return;
  }

  Future fromStore(String password) async {
    _mnemonicBean = await WalletStore.getInstance().read(password);
    _node = await Future(() {
      bip32.BIP32.fromSeed(hex.decode(_mnemonicBean.seed));
    });
  }

  String getMnemonic() {
    return _mnemonicBean.mnemonic;
  }

  // check the password right
  Future<bool> checkPwd(String password) async {
    try {
      _mnemonicBean = await WalletStore.getInstance().read(password);
      return bip39.validateMnemonic(_mnemonicBean.mnemonic);
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

  String getMasterPrivateKey() {
    return hex.encode(_node.privateKey);
  }

  set account(String account) {
    _account = account;
  }

  set external(int external) {
    _external = external;
  }

  String getReceivePrivateKey(String addressIndex) {
    return hex.encode(
        _node.derivePath('m/$_purpose/$_coinType/$_account\/$_external/$addressIndex').privateKey);
  }

  String getFeeChangePrivateKey(String addressIndex) {
    return hex.encode(_node
        .derivePath('m/$_purpose/$_coinType/$_account\/${_external + 1}/$addressIndex')
        .privateKey);
  }
}
