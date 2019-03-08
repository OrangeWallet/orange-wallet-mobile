import 'dart:typed_data';
import 'package:convert/convert.dart';
import 'package:bip32/bip32.dart' as bip32;

class WalletManager {
  static WalletManager _manager;
  static bip32.BIP32 _node;
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

  init(Uint8List seed) {
    _node = bip32.BIP32.fromSeed(seed);
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
