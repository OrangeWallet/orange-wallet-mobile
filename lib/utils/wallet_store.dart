import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ckbalance/utils/wallet_crypto.dart';

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

  write(String mnemonic, String password) {
    String base64 = WalletCrypto.encryptMnemonic(mnemonic, password);
    _storage.write(key: WalletKey, value: base64);
  }

  read(String password) async {
    String base64 = await _storage.read(key: WalletKey);
    return WalletCrypto.decrptMnemonic(base64, password);
  }

  delete() {
    _storage.delete(key: WalletKey);
  }
}
