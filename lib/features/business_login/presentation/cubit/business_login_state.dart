import 'package:career/features/business_login/data/models/login_response_model.dart';

abstract class BusinessLoginState {}

class BusinessLoginInitial extends BusinessLoginState {}

class LoadingLoginProcess extends BusinessLoginState {}

class SuccessLogin extends BusinessLoginState {
  SuccessLogin({required this.loginResponseModel});
  final LoginResponseModel loginResponseModel;
}

class ErrorLogin extends BusinessLoginState {
  ErrorLogin({required this.message});
  final String message;
}
