import 'package:OrangeWallet/utils/wallet_crypto.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class WalletStore {
  static WalletStore _instance;
  static FlutterSecureStorage _storage;
  static const String WalletKey = 'Wallet';

  WalletStore._();

  _init() {
    _storage = new FlutterSecureStorage();
  }

  static WalletStore getInstance() {
    if (_instance == null) {
      _instance = new WalletStore._();
      _instance._init();
    }
    return _instance;
  }

  Future<bool> has() async {
    String base64 = await _storage.read(key: WalletKey);
    if (base64 == null) {
      return false;
    }
    return true;
  }

  Future write(String data, String password) async {
    String base64 = WalletCrypto.encryptMnemonic(data, password);
    await _storage.write(key: WalletKey, value: base64);
  }

  Future<String> read(String password) async {
    try {
      return WalletCrypto.decrptMnemonic(await _storage.read(key: WalletKey), password);
    } catch (e) {
      throw Error();
    }
  }

  Future delete() async {
    await _storage.delete(key: WalletKey);
  }
}
