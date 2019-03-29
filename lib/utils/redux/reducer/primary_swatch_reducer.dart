import 'package:redux/redux.dart';
import 'package:flutter/material.dart';

class PrimarySwatchState {
  Color color;

  PrimarySwatchState({this.color: Colors.blue});
}

final primarySwatchReducer = combineReducers<PrimarySwatchState>([
  TypedReducer<PrimarySwatchState, PrimarySwatchAction>(_refresh),
]);

PrimarySwatchState _refresh(PrimarySwatchState state, action) {
  state = action.primarySwatchState;
  return state;
}

class PrimarySwatchAction {
  final PrimarySwatchState primarySwatchState;

  PrimarySwatchAction(this.primarySwatchState);
}
