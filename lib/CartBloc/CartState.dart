import 'package:equatable/equatable.dart';
import 'package:sweety/Models/Products.dart';

abstract class CartState extends Equatable {}

class Cart_Initical extends CartState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Cart_Loading extends CartState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Cart_Successful extends CartState{

  final List<Product> products;
  Cart_Successful(this.products);

  @override
  // TODO: implement props
  List<Object?> get props => [products];
}

class Cart_Failure extends CartState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}