import 'dart:async';
import 'package:convert/convert.dart';
import 'package:bip32/bip32.dart' as bip32;
import 'package:bip39/bip39.dart' as bip39;
import 'package:ckbalance/utils/wallet_store.dart';
import 'package:ckbalance/utils/shared_preferences.dart';
import 'package:ckbalance/resources/shared_preferences_keys.dart';

class WalletManager {
  static WalletManager _manager;
  bip32.BIP32 _node;
  final String _purpose = "44'";
  final String _coinType = "0'";
  final String _account = "0'";
  final String _receive = "0";
  final String _change = "1";

  WalletManager._();

  static WalletManager getInstance() {
    if (_manager == null) {
      _manager = WalletManager._();
    }
    return _manager;
  }

  importWallet(String mnemonic, String password) async {
    SpUtil spUtil = await SpUtil.getInstance();
    if (mnemonic == '') {
      mnemonic = bip39.generateMnemonic();
      spUtil.putBool(SharedPreferencesKeys.backup, false);
    } else {
      spUtil.putBool(SharedPreferencesKeys.backup, true);
    }
    _node = bip32.BIP32.fromSeed(bip39.mnemonicToSeed(mnemonic));
    WalletStore.getInstance().write(mnemonic, password);
  }

  fromStore(String password) async {
    String mnemonic = await WalletStore.getInstance().read(password);
    _node = bip32.BIP32.fromSeed(bip39.mnemonicToSeed(mnemonic));
  }

  // check the password right
  Future<bool> checkPwd(String password) async {
    String mnemonic = await WalletStore.getInstance().read(password);
    return bip39.validateMnemonic(mnemonic);
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

  String getReceivePrivateKey(String addressIndex) {
    return hex.encode(_node
        .derivePath('m/$_purpose/$_coinType/$_account\/$_receive/$addressIndex')
        .privateKey);
  }

  String getFeeChangePrivateKey(String addressIndex) {
    return hex.encode(_node
        .derivePath('m/$_purpose/$_coinType/$_account\/$_change/$addressIndex')
        .privateKey);
  }
}
