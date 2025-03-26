abstract class ResetPasswordState {}

class ResetPasswordInitial extends ResetPasswordState {}

class LoadingCheckPhoneState extends ResetPasswordState {}

class SuccessCheckPhoneState extends ResetPasswordState {}

class ErrorCheckPhoneState extends ResetPasswordState {
  ErrorCheckPhoneState({required this.message});
  final String message;
}
class LoadingChangePasswordState extends ResetPasswordState {}

class SuccessChangePasswordState extends ResetPasswordState {}

class ErrorChangePasswordState extends ResetPasswordState {
  ErrorChangePasswordState({required this.message});
  final String message;
}
