import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable{}

class Home_Category_Initical extends HomeState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Home_Category_Loading extends HomeState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class Home_Category_Successful extends HomeState{

  List<String>? categories;

  @override
  // TODO: implement props
  List<Object?> get props => [categories];
}

class Home_Category_Failure extends HomeState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Home_Product_Initical extends HomeState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Home_Product_Loading extends HomeState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class Home_Product_Successful extends HomeState{

  List<String>? categories;

  @override
  // TODO: implement props
  List<Object?> get props => [categories];
}

class Home_Product_Failure extends HomeState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}