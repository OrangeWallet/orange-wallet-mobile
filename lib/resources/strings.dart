class StringIds {
  static String appName = 'CKBalance';
  static String createNewWalletButton = 'createNewWallet_button';
  static String importWalletButton = 'importWallet_button';
  static String importWalletTitle = 'importWallet_title';
  static String bannerCryptoTitle = 'banner_crypto_title';
  static String bannerCryptoDetail = 'banner_crypto_detail';
  static String bannerPrivacyTitle = 'banner_privacy_title';
  static String bannerPrivacyDetail = 'banner_privacy_detail';
  static String bannerOpenSourceTitle = 'banner_open_source_title';
  static String bannerOpenSourceDetail = 'banner_open_source_detail';

  static String importWalletInputHint = 'importWallet_input_hint';
  static String importWalletInputHelper = 'importWallet_input_helper';
  static String scanQRCodeButton = 'scan_qr_button';

  static String errorEmptyInput = 'error_empty_input';
  static String errorValidMnemonic = 'error_valid_mnemonic';
}

Map<String, Map<String, Map<String, String>>> localizedValues = {
  'en': {
    'US': {
      StringIds.appName: 'CKBalance',
      StringIds.createNewWalletButton: 'ENJOY NOW',
      StringIds.importWalletButton: 'RESTORE WALLET',
      StringIds.importWalletTitle: 'Import',
      StringIds.bannerCryptoTitle: 'Crypto',
      StringIds.bannerCryptoDetail: 'Your wallet will be encrypted by hardware',
      StringIds.bannerPrivacyTitle: 'Privacy',
      StringIds.bannerPrivacyDetail:
          '${StringIds.appName} never collect personal information, we will surely never forget our words',
      StringIds.bannerOpenSourceTitle: 'Open Source',
      StringIds.bannerOpenSourceDetail:
          'Code in Github,Welcome contribution code',
      StringIds.importWalletInputHint: 'Words separated by spaces',
      StringIds.importWalletInputHelper:
          'Write here your mnemonic',
      StringIds.scanQRCodeButton: 'Scan QR Code',
      StringIds.errorEmptyInput: 'It can not be empty',
      StringIds.errorValidMnemonic: 'Wrong mnemonic',
    }
  },
  'zh': {
    'CN': {
      StringIds.appName: 'CKBalance',
      StringIds.createNewWalletButton: '立即体验',
      StringIds.importWalletButton: '从备份中还原',
      StringIds.importWalletTitle: '导入',
      StringIds.bannerCryptoTitle: '加密',
      StringIds.bannerCryptoDetail: '你的钱包会被硬件级安全加密',
      StringIds.bannerPrivacyTitle: '隐私',
      StringIds.bannerPrivacyDetail:
          '${StringIds.appName} 不会收集用户的隐私信息，现在不会，将来也不会',
      StringIds.bannerOpenSourceTitle: '开源',
      StringIds.bannerOpenSourceDetail: '代码在Github，欢迎贡献',
      StringIds.importWalletInputHint: '空格隔开',
      StringIds.importWalletInputHelper: '输入你的助记词',
      StringIds.scanQRCodeButton: '二维码',
      StringIds.errorEmptyInput: '输入项不能为空',
      StringIds.errorValidMnemonic: '助记词不合法',
    },
  }
};
