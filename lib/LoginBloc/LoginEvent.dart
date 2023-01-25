
abstract class LoginEvent {}

class Login_request extends LoginEvent{
  final String email;
  final String password;
  Login_request(this.email, this.password);
}