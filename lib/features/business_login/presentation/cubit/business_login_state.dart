abstract class BusinessLoginState {}

class BusinessLoginInitial extends BusinessLoginState {}

class LoadingLoginProcess extends BusinessLoginState {}

class SuccessLogin extends BusinessLoginState {}

class ErrorLogin extends BusinessLoginState {
  ErrorLogin({required this.message});
  final String message;
}
