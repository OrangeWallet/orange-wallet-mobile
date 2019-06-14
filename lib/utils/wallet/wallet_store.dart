import 'dart:convert';

import 'package:OrangeWallet/bean/wallet_store_bean.dart';
import 'package:OrangeWallet/utils/wallet_crypto.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class WalletStore {
  static FlutterSecureStorage _storage;
  static const String WalletKey = 'Wallet';

  WalletStore() {
    _storage = new FlutterSecureStorage();
  }

  Future<bool> has() async {
    String base64 = await _storage.read(key: WalletKey);
    if (base64 == null) {
      return false;
    }
    return true;
  }

  Future write(WalletStoreBean data, String password) async {
    String base64 = WalletCrypto.encryptMnemonic(jsonEncode(data), password);
    await _storage.write(key: WalletKey, value: base64);
  }

  Future<WalletStoreBean> read(String password) async {
    try {
      String data = WalletCrypto.decrptMnemonic(await _storage.read(key: WalletKey), password);
      return WalletStoreBean.fromJson(jsonDecode(data));
    } catch (e) {
      throw Error();
    }
  }

  Future delete() async {
    await _storage.delete(key: WalletKey);
  }
}
