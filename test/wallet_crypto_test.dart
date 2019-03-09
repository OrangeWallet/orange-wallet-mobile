import 'package:flutter_test/flutter_test.dart';
import 'package:ckbalance/utils/wallet_crypto.dart';

void main() {
  test('test crypto mnemonic', () {
    var mnemonic =
        "strategy grocery isolate they broom mean border opera topic file salon ride ";
    String data = WalletCrypto.encryptMnemonic(mnemonic, "password");
    print(data);

    String decrypted = WalletCrypto.decrptMnemonic(data, "12");
    print(decrypted);
  });
}
