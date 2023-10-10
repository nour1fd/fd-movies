part of 'authuser_cubit.dart';

@immutable
abstract class AuthuserState {}

class AuthuserInitial extends AuthuserState {}
class LoginLoading extends AuthuserInitial {}
class LoginSuccess extends AuthuserInitial {
  final User user;

  LoginSuccess(this.user);
}
class LoginError extends AuthuserInitial {
  final String error;
  LoginError(this.error);
}


class SingupLoading extends AuthuserInitial {}
class SingupSuccess extends AuthuserInitial {
  final User user;

  SingupSuccess(this.user);
}
class SingupError extends AuthuserInitial {
  final String error;
  SingupError(this.error);}
