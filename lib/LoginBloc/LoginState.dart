
import 'package:equatable/equatable.dart';
import 'package:sweety/LoginBloc/LoginState.dart';

abstract class LoginState extends Equatable{}

class Login_Initical extends LoginState{
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}

class Login_Successful extends LoginState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Login_Loading extends LoginState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class Login_Failure extends LoginState{
  Login_Failure(this.exp);
  final String exp;
  @override
  // TODO: implement props
  List<Object?> get props => [exp];
}

class Login_Error extends LoginState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}