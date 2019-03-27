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
  static String forgetPwd = 'forgetPwd';
  static String forgetDialogContent = 'forgetDialogContent';
  static String deleteWalletDialogContent = 'deleteWalletDialogContent';
  static String tryAgain = 'tryAgain';
  static String deleteWallet = 'deleteWallet';
  static String alert = 'Alert';
  static String backUp = 'backUp';
  static String backedUp = 'backedUp';
  static String backedUpTitle = 'backedUpTitle';
  static String confirmMnemonic = 'confirmMnemonic';
  static String confirMnemonicTip = 'confirMnemonicTip';

  static String ok = 'OK';
  static String cancel = 'Cancel';

  static String mainNetTip = 'MainNetTip';
  static String mainNet = 'MainNet';
  static String testNet = 'testNet';

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
      StringIds.bannerOpenSourceDetail: 'Code in Github,Welcome contribution code',
      StringIds.importWalletInputHint: 'Words separated by spaces',
      StringIds.importWalletInputHelper: 'Enter your mnemonic',
      StringIds.scanQRCodeButton: 'Scan QR Code',
      StringIds.inputPwdTitle: 'Password',
      StringIds.inputPwdTip: 'Enter your password',
      StringIds.inputPwdFieldLabel: 'Password*',
      StringIds.inputPwdFieldHelper: 'No less than 8 char',
      StringIds.inputPwdReTip: 'Confirm your password',
      StringIds.inputPwdReAttention:
          'Make sure you remember it. You can\'t use the wallet if you lose your password.',
      StringIds.nextButton: 'Next',
      StringIds.forgetPwd: 'Forget it',
      StringIds.forgetDialogContent:
          "We didn't save your password. You can not use your wallet without password.So if you hava saved your mnemonic, you can import it again!",
      StringIds.deleteWalletDialogContent:
          "Make sure you know what you're doing! If you delete this wallet, you will not get it back.(If you lost your mnomenic.)",
      StringIds.tryAgain: 'Try again',
      StringIds.deleteWallet: 'Delete wallet',
      StringIds.alert: 'Alert',
      StringIds.backUp: 'Backup',
      StringIds.backedUp: 'Backed up',
      StringIds.backedUpTitle: 'Write these down',
      StringIds.confirmMnemonic: 'Confirm Mnemonic',
      StringIds.confirMnemonicTip: 'Enter your mnemonic',
      StringIds.ok: 'OK',
      StringIds.cancel: 'Cancel',
      StringIds.mainNetTip: 'The main network is not up yet!',
      StringIds.mainNet: 'MainNet',
      StringIds.testNet: 'Test Net',
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
      StringIds.bannerPrivacyDetail: '${StringIds.appName} 不会收集用户的隐私信息，现在不会，将来也不会',
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
      StringIds.inputPwdReTip: '请在此输入密码',
      StringIds.inputPwdReAttention: '请确保记住你的密码，如果你忘记了，将无法使用钱包',
      StringIds.nextButton: '下一步',
      StringIds.forgetPwd: '忘记密码',
      StringIds.forgetDialogContent: '我们没有保存你的密码，所有无法找回，如果你有助记词请重新导入，或者继续尝试',
      StringIds.deleteWalletDialogContent: '如果你没有助记词或者私钥，删除钱包后，你将丢失整个钱包！',
      StringIds.tryAgain: '再试试',
      StringIds.deleteWallet: '删除钱包',
      StringIds.alert: '提示',
      StringIds.backUp: '备份',
      StringIds.backedUp: '已备份',
      StringIds.backedUpTitle: '请抄写在纸上',
      StringIds.confirmMnemonic: '确认助记词',
      StringIds.confirMnemonicTip: '输入你的助记词',
      StringIds.ok: '确定',
      StringIds.cancel: '取消',
      StringIds.mainNetTip: '主网还未上线!',
      StringIds.mainNet: 'MainNet',
      StringIds.testNet: 'Test Net',
      StringIds.errorEmptyInput: '输入项不能为空',
      StringIds.errorValidMnemonic: '助记词不合法',
      StringIds.errorEmptyPwd: '请输入密码',
      StringIds.errorLessPwd: '最少八位',
      StringIds.errorDiffPwd: '密码错误',
    },
  }
};
