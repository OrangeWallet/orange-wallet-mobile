import 'package:ckbalance/utils/redux/reducer/primary_swatch_reducer.dart';

class AppState {
  PrimarySwatchState primarySwatchState;

  AppState({this.primarySwatchState});
}

AppState mainReducer(AppState state, action) {
  return AppState(primarySwatchState: primarySwatchReducer(state.primarySwatchState, action));
}
