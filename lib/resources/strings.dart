class StringIds {
  static String appName = 'Orange Wallet';
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
  static String importPrivateKeyTitle = 'importPrivateKeyTitle';
  static String importKeystoreTitle = 'importKeystoreTitle';
  static String scanQRCodeButton = 'scanQRCodeButton';

  static String importAnimFirst = 'importAnimFirst';
  static String importAnimSecond = 'importAnimSecond';
  static String importAnimThird = 'importAnimThird';

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
  static String settingTitle = 'settingTitle';
  static String settingTheme = 'settingTheme';
  static String settingResetBlockChain = 'settingResetBlockChain';
  static String resetBlockChainTip = 'resetBlockChainTip';
  static String receiveAddress = 'receiveAddress';
  static String copyToClipboard = 'copyToClipboard';
  static String transferTitle = 'transferTitle';
  static String availableCapacity = 'availableCapacity';
  static String sourceCode = 'sourceCode';
  static String importKeystoreFailed = 'importKeystoreFailed';
  static String finishAppTip = 'finishAppTip';
  static String importing = 'importing';
  static String inputKeystoreLabel = 'inputKeystoreLabel';
  static String inputKeystorePasswordLabel = 'inputKeystorePasswordLabel';

  static String ok = 'OK';
  static String cancel = 'Cancel';
  static String start = 'Start';
  static String receive = 'Receive';
  static String send = 'Send';
  static String copy = 'Copy';

  static String mainNetTip = 'MainNetTip';
  static String mainNet = 'Mainnet';
  static String testNet = 'Testnet';

  static String errorEmptyInput = 'errorEmptyInput';
  static String errorValidMnemonic = 'errorValidMnemonic';
  static String errorEmptyPwd = 'errorEmptyPwd';
  static String errorLessPwd = 'errorLessPwd';
  static String errorDiffPwd = 'errorDiffPwd';
  static String errorSync = 'errorSync';
  static String errorTransferFailed = 'errorTransferFailed';
  static String errorAddressFormat = 'errorAddressFormat';
  static String capacity = 'capacity';
  static String errorNoEnoughCapacity = 'errorNoEnoughCapacity';
  static String errorLessThanMinCapacity = 'errorLessThanMinCapacity';
}

Map<String, Map<String, Map<String, String>>> localizedValues = {
  'en': {
    'US': {
      StringIds.appName: 'Orange Wallet',
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
      StringIds.importWalletInputHelper: 'Enter your privateKey or Keystore',
      StringIds.importAnimFirst: 'Generate Seed',
      StringIds.importAnimSecond: 'Generate Keystore',
      StringIds.importAnimThird: 'Save Wallet',
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
      StringIds.settingTitle: 'Settings',
      StringIds.settingTheme: 'Theme',
      StringIds.settingResetBlockChain: 'Reset block chain',
      StringIds.resetBlockChainTip:
          'Pay attention! Reset block chain and wallet balance.Replay will take a while,so only do this if you know why.',
      StringIds.finishAppTip: 'Quickly click the back key to exit the program',
      StringIds.importPrivateKeyTitle: 'Enter your PrivateKey',
      StringIds.importKeystoreTitle: 'Enter your Keystore',
      StringIds.receiveAddress: 'Receive Address',
      StringIds.copyToClipboard: 'Copied to Clipboard',
      StringIds.transferTitle: 'Transfer',
      StringIds.ok: 'OK',
      StringIds.cancel: 'Cancel',
      StringIds.start: 'Start',
      StringIds.receive: 'Receive',
      StringIds.send: 'Send',
      StringIds.copy: 'Copy',
      StringIds.availableCapacity: 'Available Capacity',
      StringIds.mainNetTip: 'The main network is not up yet!',
      StringIds.mainNet: 'Mainnet',
      StringIds.testNet: 'Testnet',
      StringIds.errorEmptyInput: 'It can not be empty',
      StringIds.errorValidMnemonic: 'Wrong mnemonic',
      StringIds.errorEmptyPwd: 'Please enter a password.',
      StringIds.errorLessPwd: 'No less than 8 char',
      StringIds.errorDiffPwd: 'Wrong password',
      StringIds.errorSync: 'Sync failed',
      StringIds.errorTransferFailed: 'Transfer failed',
      StringIds.errorAddressFormat: 'Wrong Address',
      StringIds.capacity: 'Capacity',
      StringIds.errorNoEnoughCapacity: 'You don`t have enough CKB',
      StringIds.errorLessThanMinCapacity: 'Less than min capacity(60CKB)',
      StringIds.sourceCode: 'Source Code',
      StringIds.importKeystoreFailed:
          'Import Keystore Failed,Please check your keystore and password',
      StringIds.importing: 'Importing',
      StringIds.inputKeystoreLabel: 'Keystore',
      StringIds.inputKeystorePasswordLabel: 'Password of keystore',
    }
  },
  'zh': {
    'CN': {
      StringIds.appName: 'Orange Wallet',
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
      StringIds.importWalletInputHelper: '输入你的私钥或Keystore',
      StringIds.importAnimFirst: '生成种子',
      StringIds.importAnimSecond: '生成助记词',
      StringIds.importAnimThird: '保存钱包',
      StringIds.scanQRCodeButton: '二维码',
      StringIds.errorEmptyInput: '输入项不能为空',
      StringIds.errorValidMnemonic: '助记词不合法',
      StringIds.inputPwdTitle: '密码',
      StringIds.inputPwdTip: '请输入你的密码',
      StringIds.inputPwdFieldLabel: '密码*',
      StringIds.inputPwdFieldHelper: '最少八位密码',
      StringIds.inputPwdReTip: '请再次输入密码',
      StringIds.inputPwdReAttention: '请确保记住你的密码，如果你忘记了，将无法使用钱包',
      StringIds.nextButton: '下一步',
      StringIds.forgetPwd: '忘记密码',
      StringIds.forgetDialogContent: '我们没有保存你的密码，所有无法找回，如果你有助记词请重新导入，或者继续尝试',
      StringIds.deleteWalletDialogContent: '如果你没有助记词或者私钥，删除钱包后，你将丢失整个钱包！',
      StringIds.finishAppTip: '快速点击返回键，退出程序',
      StringIds.tryAgain: '再试试',
      StringIds.deleteWallet: '删除钱包',
      StringIds.alert: '提示',
      StringIds.backUp: '备份',
      StringIds.backedUp: '已备份',
      StringIds.backedUpTitle: '请抄写在纸上',
      StringIds.confirmMnemonic: '确认助记词',
      StringIds.confirMnemonicTip: '输入你的助记词',
      StringIds.settingTitle: '设置',
      StringIds.settingTheme: '主题',
      StringIds.transferTitle: '转账',
      StringIds.settingResetBlockChain: '重置链',
      StringIds.resetBlockChainTip: '注意，重置链将会删除区块以及钱包余额，重新同步将需要一定时间',
      StringIds.receiveAddress: '收款地址',
      StringIds.copyToClipboard: '已复制到粘贴板',
      StringIds.availableCapacity: '可用余额',
      StringIds.importPrivateKeyTitle: '输入私钥',
      StringIds.importKeystoreTitle: '输入Keystore',
      StringIds.ok: '确定',
      StringIds.cancel: '取消',
      StringIds.start: '开始',
      StringIds.receive: '收款',
      StringIds.send: '付款',
      StringIds.copy: '复制',
      StringIds.mainNetTip: '主网还未上线!',
      StringIds.mainNet: 'Mainnet',
      StringIds.testNet: 'Testnet',
      StringIds.errorEmptyInput: '输入项不能为空',
      StringIds.errorValidMnemonic: '助记词不合法',
      StringIds.errorEmptyPwd: '请输入密码',
      StringIds.errorLessPwd: '最少八位',
      StringIds.errorDiffPwd: '密码错误',
      StringIds.errorSync: '同步失败',
      StringIds.errorTransferFailed: '转账失败',
      StringIds.errorAddressFormat: '地址错误',
      StringIds.capacity: 'Capacity',
      StringIds.errorNoEnoughCapacity: '你没有足够的CKB',
      StringIds.errorLessThanMinCapacity: '最小转账为60CKB',
      StringIds.sourceCode: '源码',
      StringIds.importKeystoreFailed: '导入Keystore失败，请检查Keystore和密码',
      StringIds.importing: '导入中',
      StringIds.inputKeystoreLabel: '请输入Keystore',
      StringIds.inputKeystorePasswordLabel: 'Keystore密码'
    },
  }
};
