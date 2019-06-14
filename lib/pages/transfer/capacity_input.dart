import 'package:OrangeWallet/contant/constant.dart';
import 'package:OrangeWallet/resources/strings.dart';
import 'package:OrangeWallet/utils/wallet/my_wallet_core.dart';
import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ckbcore/ckbcore_constant.dart';

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
        labelText: CustomLocalizations.of(context).getString(StringIds.capacity),
        suffixText: ckbUnit,
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
            errorMessage =
                CustomLocalizations.of(context).getString(StringIds.errorNoEnoughCapacity);
          });
          widget.capacityChanged('');
        } else if (double.parse(str) < MinCapacity) {
          setState(() {
            errorMessage =
                CustomLocalizations.of(context).getString(StringIds.errorLessThanMinCapacity);
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
