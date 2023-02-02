
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sweety/CupponDetailsBloc/CupponDetailsEvent.dart';
import 'package:sweety/CupponDetailsBloc/CupponDetailsState.dart';
import 'package:sweety/Models/Cuppon.dart';

class CupponDetailsBloc extends Bloc<CupponDetailsEvent,CupponDetailsState>{
  CupponDetailsBloc():super(CupponDetailsInitical()){
    on((event, emit) async {
      if(event != CupponDetailsEvent.Request)
        return;

      emit(CupponDetailsLoading());
      await Future.delayed(Duration(seconds: 1));
      emit(
        CupponDetailsSuccessful(
          Cuppon(
              id: 'XUAN',
            description: '',
            minApply: 100000,
            maxOff: 20000,
            percentOff: 0.2,
            saleOff: -1,
            exp: DateTime.now(),
          )
        )
      );
    } );
  }
}