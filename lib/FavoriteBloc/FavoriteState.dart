import 'package:equatable/equatable.dart';

import '../Models/Products.dart';

abstract class FavoriteState extends Equatable {}

class Favorite_Initical extends FavoriteState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Favorite_Loading extends FavoriteState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Favorite_Successful extends FavoriteState{

  final List<Product> products;
  Favorite_Successful(this.products);

  @override
  // TODO: implement props
  List<Object?> get props => [products];
}

class Favorite_Failure extends FavoriteState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}