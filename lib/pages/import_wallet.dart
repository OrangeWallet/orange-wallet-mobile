import 'package:OrangeWallet/views/import_input_field.dart';
import 'package:flutter/material.dart';
import 'package:OrangeWallet/resources/strings.dart';
import 'package:fluintl/fluintl.dart';
import 'package:OrangeWallet/pages/input_password.dart';

enum ImportType { Keystore, PrivateKey }

class ImportWalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(CustomLocalizations.of(context).getString(StringIds.importWalletTitle)),
          leading: IconButton(
            tooltip: 'back',
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          bottom: TabBar(tabs: [
            Tab(text: "PrivateKey"),
            Tab(text: "Keystore"),
          ]),
        ),
        body: TabBarView(children: [
          ImportInputField(
            title: CustomLocalizations.of(context).getString(StringIds.importPrivateKeyTitle),
            handle: (data) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => InputPasswordPage(
                        data: data,
                        type: ImportType.PrivateKey,
                      )));
            },
          ),
          ImportInputField(
            title: CustomLocalizations.of(context).getString(StringIds.importKeystoreTitle),
            handle: (data) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => InputPasswordPage(
                        data: data,
                        type: ImportType.Keystore,
                      )));
            },
          ),
        ]),
      ),
    );
  }
}
