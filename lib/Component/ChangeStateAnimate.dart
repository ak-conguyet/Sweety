import 'package:flutter/material.dart';

abstract class ChangeStateAnimate<S> {
  Widget blocState(S state,
      {Duration duration = const Duration(milliseconds: 300),
        Curve inCurve = Curves.linear,
        Curve outCurve = Curves.linear}) {
    return AnimatedSwitcher(
      switchInCurve: inCurve,
      switchOutCurve: outCurve,
      duration: duration,
      transitionBuilder: (child,animation)=>transitionBuilder(child, animation),
      child: stateBuilder(state),
    );
  }

  Widget transitionBuilder(Widget child, Animation<double> animation) => FadeTransition(
    opacity: animation,
    child: child,
  );

  @protected
  Widget stateBuilder(S state);
}