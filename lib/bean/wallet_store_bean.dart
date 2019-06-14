class WalletStoreBean {
  String publicKey;
  String keystore;

  WalletStoreBean(this.publicKey, this.keystore);

  factory WalletStoreBean.fromJson(Map<String, dynamic> json) => WalletStoreBean(
    json['publicKey'] as String,
    json['keystore'] as String,
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'publicKey': publicKey,
    'keystore': keystore,
  };
}
