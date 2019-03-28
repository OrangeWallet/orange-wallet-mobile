import 'dart:isolate';
import 'dart:typed_data';
import 'package:bip39/bip39.dart' as bip39;

class MnemonicToSeedIsolate {
  static loadData(String mnemonic) async {
    ReceivePort receivePort = ReceivePort();
    await Isolate.spawn(_dateLoader, receivePort.sendPort);
    SendPort sendPort = await receivePort.first;
    Uint8List seed = await _sendReceive(mnemonic, sendPort);
    return seed;
  }

  static _dateLoader(SendPort sendPort) async {
    ReceivePort port = ReceivePort();
    sendPort.send(port.sendPort);
    await for (var msg in port) {
      String mnemonic = msg[0];
      SendPort replyTo = msg[1];
      Uint8List seed = bip39.mnemonicToSeed(mnemonic);
      replyTo.send(seed);
    }
  }

  static Future _sendReceive(String mnemonic, SendPort port) {
    ReceivePort response = ReceivePort();
    port.send([mnemonic, response.sendPort]);
    return response.first;
  }
}
