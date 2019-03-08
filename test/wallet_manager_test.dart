import 'package:flutter_test/flutter_test.dart';
import 'package:ckbalance/utils/wallet_manager.dart';
import 'package:bip39/bip39.dart' as bip39;

void main() {
  var mnemonic =
      'strategy grocery isolate they broom mean border opera topic file salon ride ';
  var seed = bip39.mnemonicToSeed(mnemonic);
  WalletManager.getInstance().init(seed);
  test('get master private key', () {
    String master = WalletManager.getInstance().getMasterPrivateKey();
    print(master);
  });

  test('get child receive private key', () {
    String child = WalletManager.getInstance().getReceivePrivateKey('0');
    print(child);
  });

  test('get child change private key', () {
    String child = WalletManager.getInstance().getFeeChangePrivateKey('0');
    print(child);
  });
}
