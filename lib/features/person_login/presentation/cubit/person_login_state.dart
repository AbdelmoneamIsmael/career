part of 'person_login_cubit.dart';

abstract class PersonLoginState {}

class PersonLoginInitial extends PersonLoginState {}
class LoadingLoginProcess extends PersonLoginState {}

class SuccessLogin extends PersonLoginState {
  SuccessLogin({required this.loginResponseModel});
  final LoginResponseModel loginResponseModel;
}

class ErrorLogin extends PersonLoginState {
  ErrorLogin({required this.message});
  final String message;
}
