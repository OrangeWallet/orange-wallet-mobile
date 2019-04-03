import 'package:OrangeWallet/resources/shared_preferences_keys.dart';
import 'package:OrangeWallet/utils/provide/theme_color_notifier.dart';
import 'package:OrangeWallet/utils/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';

class ThemeSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        height: 300,
        padding: const EdgeInsets.only(bottom: 10),
        child: ListView.builder(
          itemCount: Colors.primaries.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.primaries[index],
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                height: 30,
              ),
              onTap: () async {
                SpUtil spUtil = await SpUtil.getInstance();
                await spUtil.putInt(SpKeys.themeColor, index);
                final currentThemeColor = Provide.value<ThemeColorProvider>(context);
                currentThemeColor.color = Colors.primaries[index];
                Navigator.of(context).pop(null);
              },
            );
          },
        ),
      ),
    );
  }
}
