import 'package:flutter_test/flutter_test.dart';
import 'package:bip39/bip39.dart' as bip39;

void main() {
  test("bip39 test", () {
    var mnemonic =
        'strategy grocery isolate they broom mean border opera topic file salon ride ';
    var seed = bip39.mnemonicToSeedHex(mnemonic);
    var valid = bip39.validateMnemonic(mnemonic);
    print(valid);
    // var seed = bip39.mnemonicToSeedHex(
    //     'travel wet limit stand object fossil win veteran fine prosper spatial near turn casual educate palm theme spare tenant news hammer chalk bean happy');
    print(seed);
  });
}
