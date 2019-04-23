class WalletStoreBean {
  final String mnemonic;
  final String seed;
  final int receiveIndex;
  final int changeIndex;

  WalletStoreBean(this.mnemonic, this.seed, this.receiveIndex, this.changeIndex);

  factory WalletStoreBean.fromJson(Map<String, dynamic> json) => WalletStoreBean(
        json['mnemonic'] as String,
        json['seed'] as String,
        json['receiveIndex'] as int,
        json['changeIndex'] as int,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'mnemonic': mnemonic,
        'seed': seed,
        'receiveIndex': receiveIndex,
        'changeIndex': changeIndex,
      };
}
