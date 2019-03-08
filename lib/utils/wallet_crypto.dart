import 'package:encrypt/encrypt.dart';
import 'package:pointycastle/digests/blake2b.dart';
import 'dart:convert';
import 'dart:typed_data';

class WalletCrypto {
 static String encryptMnemonic(String mnemonic, String password) {
    var key = Key(_hashPassword(password));
    final iv = IV.fromLength(8);

    final encrypter = Encrypter(Salsa20(key, iv));
    final encrypted = encrypter.encrypt(mnemonic);
    return encrypted.base64;
  }

 static String decrptMnemonic(String data, String password) {
    var key = Key(_hashPassword(password));
    final iv = IV.fromLength(8);

    final encrypter = Encrypter(Salsa20(key, iv));
    final decrypted = encrypter.decrypt64(data);
    return decrypted;
  }

 static Uint8List _hashPassword(String password) {
    final Blake2bDigest blake2bDigest = new Blake2bDigest(digestSize: 32);
    return blake2bDigest.process(utf8.encode(password));
  }
}
