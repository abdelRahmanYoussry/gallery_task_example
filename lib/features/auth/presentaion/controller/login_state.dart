part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccessState extends LoginState {
  final LoginModel loginModel;
  LoginSuccessState(this.loginModel);
}

class LoginLoadingState extends LoginState {}

class LoginErrorState extends LoginState {}
