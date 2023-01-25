
import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sweety/LoginBloc/LoginEvent.dart';
import 'package:sweety/LoginBloc/LoginState.dart';

class Login_Bloc extends Bloc<LoginEvent,LoginState>{

  Login_Bloc():super(Login_Initical()){
    on<Login_request>((event, emit) => _request(event));
  }
  
  void _request(Login_request event) async {
    
    emit(Login_Loading());
    await Future.delayed(Duration(seconds: 2));
    String email = event.email;
    String password = event.password;

    if(email != 'igg.anhkiet1@gmail.com'){
      emit(Login_Failure('Email is not correct'));
      return;
    }

    if(password != '123456'){
      emit(Login_Failure('Password is not correct'));
      return;
    }

    emit(Login_Successful());
  }

}