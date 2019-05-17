import 'package:OrangeWallet/contant/constant.dart';
import 'package:OrangeWallet/pages/transfer/address_input.dart';
import 'package:OrangeWallet/resources/strings.dart';
import 'package:OrangeWallet/utils/provide/balance_notifier.dart';
import 'package:OrangeWallet/utils/wallet/my_wallet_core.dart';
import 'package:OrangeWallet/views/button/my_raised_button.dart';
import 'package:OrangeWallet/views/dialog/password_dialog.dart';
import 'package:OrangeWallet/views/loading.dart';
import 'package:ckb_sdk/ckb_address/ckb_address.dart';
import 'package:ckbcore/base/bean/receiver_bean.dart';
import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';

import 'capacity_input.dart';

class TransferPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<TransferPage> {
  String capacity = '';
  String address = '';
  String addressError = '';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final balanceProvider = Provide.value<BalanceProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(CustomLocalizations.of(context).getString(StringIds.transferTitle)),
      ),
      body: isLoading
          ? WillPopScope(child: Loading(), onWillPop: () {})
          : Container(
              alignment: Alignment(0, -0.7),
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  StreamBuilder<BalanceProvider>(
                      stream: Provide.stream<BalanceProvider>(context),
                      initialData: balanceProvider,
                      builder: (context, provider) {
                        return Flex(
                          direction: Axis.horizontal,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      CustomLocalizations.of(context)
                                          .getString(StringIds.availableCapacity),
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    SizedBox(width: 6),
                                    Icon(
                                      Icons.info,
                                      color: Theme.of(context).primaryColor,
                                      size: 18,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Text(
                                  provider.data.balance.availableForDisplay.balance +
                                      " " +
                                      provider.data.balance.availableForDisplay.uint,
                                  style: TextStyle(fontSize: 26),
                                ),
                              ],
                            )
                          ],
                        );
                      }),
                  SizedBox(height: 10),
                  CapacityInput(
                    capacityChanged: (capacity) {
                      setState(() {
                        this.capacity = capacity;
                      });
                    },
                  ),
                  AddressInput(
                    addressChange: (address) {
                      setState(() {
                        this.address = address;
                      });
                    },
                    errorMessage: addressError,
                  ),
                  MyRaisedButton(
                    onPressed: capacity != '' && address != ''
                        ? () async {
                            if (_validateAddress(address)) {
                              try {
                                showDialog(
                                    context: context,
                                    builder: (_) {
                                      return PasswordDialog((password) async {
                                        setState(() {
                                          isLoading = true;
                                        });
                                        String hash = await MyWalletCore.getInstance().sendCapacity(
                                            [
                                              ReceiverBean(address, int.parse(capacity) * 100000000)
                                            ],
                                            network);
                                        if (hash != null) {
                                          Navigator.of(context).pop();
                                        } else {
                                          _showErrorDialog(
                                              context,
                                              CustomLocalizations.of(context)
                                                  .getString(StringIds.errorTransferFailed));
                                        }
                                      });
                                    });
                              } catch (e) {
                                _showErrorDialog(context, e.toString());
                              }
                            }
                          }
                        : null,
                    text: CustomLocalizations.of(context).getString(StringIds.send),
                  )
                ],
              ),
            ),
    );
  }

  bool _validateAddress(String address) {
    try {
      CKBAddress ckbAddress = CKBAddress(network);
      ckbAddress.parse(address);
    } catch (e) {
      setState(() {
        addressError = CustomLocalizations.of(context).getString(StringIds.errorAddressFormat);
      });
      return false;
    }
    return true;
  }

  _showErrorDialog(BuildContext context, String content) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(CustomLocalizations.of(context).getString(StringIds.alert)),
            content: Text(content),
            actions: <Widget>[
              FlatButton(
                child: Text(CustomLocalizations.of(context).getString(StringIds.ok)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
