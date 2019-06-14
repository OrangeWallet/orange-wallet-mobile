class WalletStoreBean {
  String publicKey;
  String keystore;

  WalletStoreBean(publicKey, keystore);

  factory WalletStoreBean.fromJson(Map<String, dynamic> json) => WalletStoreBean(
    json['publicKey'] as String,
    json['keystore'] as String,
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'publicKey': publicKey,
    'keystore': keystore,
  };
}
