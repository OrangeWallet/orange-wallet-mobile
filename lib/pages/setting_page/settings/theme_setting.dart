import 'package:ckbalance/resources/shared_preferences_keys.dart';
import 'package:ckbalance/utils/redux/reducer/primary_swatch_reducer.dart';
import 'package:ckbalance/utils/redux/store.dart';
import 'package:ckbalance/utils/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

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
                StoreProvider.of<AppState>(context).dispatch(
                    PrimarySwatchAction(PrimarySwatchState(color: Colors.primaries[index])));
                SpUtil spUtil = await SpUtil.getInstance();
                await spUtil.putInt(SharedPreferencesKeys.themeColor, index);
                Navigator.of(context).pop(null);
              },
            );
          },
        ),
      ),
    );
  }
}
