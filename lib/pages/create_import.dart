import 'package:flutter/material.dart';
import 'package:OrangeWallet/resources/strings.dart';
import 'package:fluintl/fluintl.dart';
import 'package:OrangeWallet/pages/import_wallet.dart';
import 'package:OrangeWallet/views/page_indicator.dart';
import 'package:OrangeWallet/pages/input_password.dart';
import 'package:OrangeWallet/views/button/my_raised_button.dart';

class CreateImportPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<CreateImportPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Theme.of(context).primaryColorDark,
          Theme.of(context).primaryColor,
          Theme.of(context).primaryColorLight,
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Column(
          children: <Widget>[
            Expanded(
              child: pageView(),
            ),
            SizedBox(
              height: 15,
            ),
            MyRaisedButton(
              padding: const EdgeInsets.fromLTRB(90, 10, 90, 10),
              text: CustomLocalizations.of(context).getString(StringIds.createNewWalletButton),
              onPressed: () {
                // create a mnemonic , and ask user to set a password
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context) => InputPasswordPage()));
              },
              color: Colors.white,
              fontColor: Theme.of(context).primaryColor,
            ),
            FlatButton(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 50),
              child: Text(
                CustomLocalizations.of(context).getString(StringIds.importWalletButton),
                style: Theme.of(context).textTheme.button,
              ),
              onPressed: () {
                // import mnemonic
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) => ImportWalletPage()));
              },
            ),
          ],
        ),
      ),
    );
  }

  // build view Pager
  Widget pageView() {
    PageController pageController = PageController(viewportFraction: 1);
    List<Widget> pages = _buildPages();
    return Column(
      children: <Widget>[
        Expanded(
          child: PageView.builder(
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            controller: pageController,
            itemCount: pages.length,
            itemBuilder: (BuildContext context, int index) {
              return pages[index];
            },
          ),
        ),
        PageIndicator(
            count: pages.length,
            normalColor: Colors.white,
            selectColor: Colors.red[300],
            currentIndex: _currentIndex),
      ],
    );
  }

  // add page
  List<Widget> _buildPages() {
    List<Widget> pages = [];
    pages.add(pageViewHome(
        Icons.security,
        CustomLocalizations.of(context).getString(StringIds.bannerCryptoTitle),
        CustomLocalizations.of(context).getString(StringIds.bannerCryptoDetail)));
    pages.add(pageViewHome(
        Icons.sync_disabled,
        CustomLocalizations.of(context).getString(StringIds.bannerPrivacyTitle),
        CustomLocalizations.of(context).getString(StringIds.bannerPrivacyDetail)));
    pages.add(pageViewHome(
        Icons.public,
        CustomLocalizations.of(context).getString(StringIds.bannerOpenSourceTitle),
        CustomLocalizations.of(context).getString(StringIds.bannerOpenSourceDetail)));
    return pages;
  }

  Widget pageViewHome(IconData iconData, String title, String detail) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 100),
          Center(
              child: Text(
            CustomLocalizations.of(context).getString(StringIds.appName),
            style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
          )),
          SizedBox(height: 30),
          Center(
            child: Icon(
              iconData,
              size: 150,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 40),
          Padding(
              padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style:
                        TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    detail,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
