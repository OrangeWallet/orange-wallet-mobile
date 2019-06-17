import 'package:flutter_test/flutter_test.dart';
import 'package:OrangeWallet/utils/wallet_crypto.dart';

void main() {
  test('test crypto mnemonic', () {
    var mnemonic = "strategy grocery isolate they broom mean border opera topic file salon ride ";
    String data = WalletCrypto.encryptMnemonic(mnemonic, "password");
    print(data);
    try {
      String decrypted = WalletCrypto.decrptMnemonic(data, "123");
      print(decrypted);
    } catch (e) {
      print(e.toString());
    }
  });

  test('crypto', () {
    String encrype = WalletCrypto.encryptMnemonic("123456789", '123');
    print(encrype);
    String data = WalletCrypto.decrptMnemonic(encrype, "123");
    print(data);
  });
}
