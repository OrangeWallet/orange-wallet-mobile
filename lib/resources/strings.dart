class StringIds {
  static String appName = 'CKBalance';
  static String createNewWalletButton = 'createNewWalletButton';
  static String importWalletButton = 'importWalletButton';
  static String importWalletTitle = 'importWalletTitle';
  static String bannerCryptoTitle = 'bannerCryptoTitle';
  static String bannerCryptoDetail = 'bannerCryptoDetail';
  static String bannerPrivacyTitle = 'bannerPrivacyTitle';
  static String bannerPrivacyDetail = 'bannerPrivacyDetail';
  static String bannerOpenSourceTitle = 'bannerOpenSourceTitle';
  static String bannerOpenSourceDetail = 'bannerOpenSourceDetail';

  static String importWalletInputHint = 'importWalletInputHint';
  static String importWalletInputHelper = 'importWalletInputHelper';
  static String scanQRCodeButton = 'scanQRCodeButton';

  static String inputPwdTitle = 'inputPwdTitle';
  static String inputPwdTip = 'inputPwdTip';
  static String inputPwdFieldLabel = 'inputPwdFieldLabel';
  static String inputPwdFieldHelper = 'inputPwdFieldHelper';
  static String inputPwdReTip = 'inputPwdReTip';
  static String inputPwdReAttention = 'inputPwdReAttention';
  static String nextButton = 'nextButton';

  static String errorEmptyInput = 'errorEmptyInput';
  static String errorValidMnemonic = 'errorValidMnemonic';
  static String errorEmptyPwd = 'errorEmptyPwd';
  static String errorLessPwd = 'errorLessPwd';
  static String errorDiffPwd = 'errorDiffPwd';
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
      StringIds.importWalletInputHelper: 'Write here your mnemonic',
      StringIds.scanQRCodeButton: 'Scan QR Code',
      StringIds.inputPwdTitle: 'Password',
      StringIds.inputPwdTip: 'Enter your password',
      StringIds.inputPwdFieldLabel: 'Password*',
      StringIds.inputPwdFieldHelper: 'No less than 8 char',
      StringIds.inputPwdReTip: 'Your password again',
      StringIds.inputPwdReAttention:'Make sure you remember it. We can\'t find the wallet if you lose your password.',
      StringIds.nextButton: 'Next',
      StringIds.errorEmptyInput: 'It can not be empty',
      StringIds.errorValidMnemonic: 'Wrong mnemonic',
      StringIds.errorEmptyPwd: 'Please enter a password.',
      StringIds.errorLessPwd: 'No less than 8 char',
      StringIds.errorDiffPwd: 'Wrong password',
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
      StringIds.inputPwdTitle: '密码',
      StringIds.inputPwdTip: '请输入你的密码',
      StringIds.inputPwdFieldLabel: '密码*',
      StringIds.inputPwdFieldHelper: '最少八位密码',
      StringIds.inputPwdReTip: '请在此输入密码，注意，密码不能修改，不能找回，请确保你记住了自己的密码！',
      StringIds.nextButton: '下一步',
      StringIds.errorEmptyInput: '输入项不能为空',
      StringIds.errorValidMnemonic: '助记词不合法',
      StringIds.errorEmptyPwd: '请输入密码',
      StringIds.errorLessPwd: '最少八位',
      StringIds.errorDiffPwd: '密码错误',
    },
  }
};
