import 'package:flutter/material.dart';
import 'package:ckbalance/resources/strings.dart';
import 'package:fluintl/fluintl.dart';
import 'package:ckbalance/pages/import_wallet_page.dart';
import 'package:ckbalance/views/page_indicator.dart';
import 'package:ckbalance/pages/input_password.dart';

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
            gradient: const LinearGradient(colors: [
          Colors.blueAccent,
          Colors.blue,
          Colors.lightBlue,
        ], begin: Alignment.topCenter)),
        child: Column(
          children: <Widget>[
            Expanded(
              child: pageView(),
            ),
            SizedBox(
              height: 15,
            ),
            RaisedButton(
              padding: const EdgeInsets.fromLTRB(90, 10, 90, 10),
              child: Text(
                CustomLocalizations.of(context)
                    .getString(StringIds.createNewWalletButton),
                style: Theme.of(context).textTheme.button,
              ),
              onPressed: () {
                // create a mnemonic , and ask user to set a password

                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => InputPasswordPage()));
              },
              color: Colors.red[300],
            ),
            FlatButton(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 50),
              child: Text(
                CustomLocalizations.of(context)
                    .getString(StringIds.importWalletButton),
                style: Theme.of(context).textTheme.button,
              ),
              onPressed: () {
                // import mnemonic
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => ImportWalletPage()));
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
        CustomLocalizations.of(context)
            .getString(StringIds.bannerCryptoDetail)));
    pages.add(pageViewHome(
        Icons.sync_disabled,
        CustomLocalizations.of(context).getString(StringIds.bannerPrivacyTitle),
        CustomLocalizations.of(context)
            .getString(StringIds.bannerPrivacyDetail)));
    pages.add(pageViewHome(
        Icons.public,
        CustomLocalizations.of(context)
            .getString(StringIds.bannerOpenSourceTitle),
        CustomLocalizations.of(context)
            .getString(StringIds.bannerOpenSourceDetail)));
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
            style: TextStyle(
                fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
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
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
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
