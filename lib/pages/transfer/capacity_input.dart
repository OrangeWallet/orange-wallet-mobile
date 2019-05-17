import 'package:OrangeWallet/utils/wallet/my_wallet_core.dart';
import 'package:ckbcore/base/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CapacityInput extends StatefulWidget {
  final ValueChanged capacityChanged;

  CapacityInput({@required this.capacityChanged});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<CapacityInput> {
  final controller = TextEditingController();
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: 'Capacity',
        suffixText: 'CKB',
        errorText: errorMessage,
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [WhitelistingTextInputFormatter(RegExp("[0-9.]"))],
      onChanged: (str) {
        if (str.substring(str.length - 1) == '.' && str.indexOf('.') != str.length - 1) {
          controller.text = str.substring(0, str.length - 1);
          widget.capacityChanged('');
        } else if (double.parse(str) * 100000000 >
            MyWalletCore.getInstance().balanceBean.availableCapacity) {
          setState(() {
            errorMessage = 'You don`t have enough CKB';
          });
          widget.capacityChanged('');
        } else if (double.parse(str) < MinCapacity) {
          setState(() {
            errorMessage = 'Less than min capacity(60CKB)';
          });
          widget.capacityChanged('');
        } else {
          widget.capacityChanged(controller.text);
          setState(() {
            errorMessage = '';
          });
        }
      },
    );
  }
}
