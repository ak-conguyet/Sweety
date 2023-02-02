
import 'package:equatable/equatable.dart';

import '../Models/Cuppon.dart';

abstract class CupponDetailsState extends Equatable{}

class CupponDetailsInitical extends CupponDetailsState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CupponDetailsLoading extends CupponDetailsState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CupponDetailsSuccessful extends CupponDetailsState{

  final Cuppon cuppon;

  CupponDetailsSuccessful(this.cuppon);

  @override
  // TODO: implement props
  List<Object?> get props => [cuppon];
}