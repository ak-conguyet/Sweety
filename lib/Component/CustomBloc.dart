
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sweety/CartBloc/CartState.dart';
import 'package:sweety/Component/ChangeStateAnimate.dart';

abstract class CustomBloc<B extends StateStreamable<S>,S> extends StatelessWidget with ChangeStateAnimate<S> {
  CustomBloc({Key? key, required this.bloc, this.state}) : super(key: key);
  final B bloc;
  final S? state;
  late BuildContext context;
  bool useAniStateChange = true;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return BlocConsumer<B,S>(
        bloc: bloc,
        listener: (context,state)=>listener(context, state),
        listenWhen: (privi, state)=>listennerWhen(state),
        buildWhen: (s1,s2)=>buildwhen(s1, s2),
        builder:(context,state)=>blocState(state)
    );
  }

  void listener(BuildContext context, S state);
  bool listennerWhen(S state)=>true;
  bool buildwhen(S s1, S s2)=>true;
}