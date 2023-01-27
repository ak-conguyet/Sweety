
abstract class HomeEvent {}

class Home_request extends HomeEvent{
  final String? categoryId;
  Home_request({this.categoryId});
}

