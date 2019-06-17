import 'dart:math';
import 'dart:typed_data';

import 'package:OrangeWallet/bean/wallet_store_bean.dart';
import 'package:OrangeWallet/utils/wallet/wallet_store.dart';
import 'package:ckbcore/ckbcore.dart';

class KeystoreParams {
  String keystore;
  Uint8List privateKey;
  String password;

  KeystoreParams(
    this.password, {
    this.keystore,
    this.privateKey,
  });
}

class WriteWalletParams {
  WalletStoreBean walletStoreBean;
  String password;

  WriteWalletParams(this.walletStoreBean, this.password);
}

Keystore fromJson(KeystoreParams params) {
  return Keystore.fromJson(params.keystore, params.password);
}

Keystore createNew(KeystoreParams params) {
  return Keystore.createNew(params.privateKey, params.password, Random.secure());
}

String keystoreToJson(Keystore keystore) {
  return keystore.toJson();
}

Future writeWallet(WriteWalletParams params) {
  return WalletStore().write(params.walletStoreBean, params.password);
}
