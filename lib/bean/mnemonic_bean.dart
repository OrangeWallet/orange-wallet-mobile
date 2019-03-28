class MnemonicBean {
  String mnemonic;
  String seed;

  MnemonicBean(this.mnemonic, this.seed);

  factory MnemonicBean.fromJson(Map<String, dynamic> json) => MnemonicBean(
        json['mnemonic'] as String,
        json['seed'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'mnemonic': mnemonic,
        'seed': seed,
      };
}
