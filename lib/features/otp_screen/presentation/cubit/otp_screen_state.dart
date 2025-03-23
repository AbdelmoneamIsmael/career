abstract class OtpScreenState {}

class OtpScreenInitial extends OtpScreenState {}

class LoadingOtpConfirmationProccess extends OtpScreenState {}

class SuccessOtpConfirmationProccess extends OtpScreenState {}

class SuccessresendOtpProccess extends OtpScreenState {}

class FailedOtpConfirmationProccess extends OtpScreenState {
  FailedOtpConfirmationProccess({required this.message});
  final String message;
}
