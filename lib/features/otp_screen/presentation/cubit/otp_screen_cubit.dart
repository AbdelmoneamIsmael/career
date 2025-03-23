import 'package:bloc/bloc.dart';
import 'package:career/core/bloc/app_bloc.dart';
import 'package:career/features/otp_screen/domain/entities/conform_parameters.dart';
import 'package:career/features/otp_screen/domain/usecases/confirm_otp_use_cases.dart';
import 'package:career/features/otp_screen/presentation/cubit/otp_screen_state.dart';
import 'package:flutter/src/widgets/framework.dart';

class OtpScreenCubit extends Cubit<OtpScreenState> {
  OtpScreenCubit({
    required this.confirmOtpUseCases,
    required this.phoneNumber,
    required this.appBloc,
  }) : super(OtpScreenInitial());
  final ConfirmOtpUseCases confirmOtpUseCases;
  final AppBloc appBloc;
  final String phoneNumber;
  submitOtp(String otp) async {
    emit(LoadingOtpConfirmationProccess());

    try {
      var result = await confirmOtpUseCases.confirmOtp(
        optPrameters: ConfirmOtpParameters(
          otp: otp,
          phoneNumber: phoneNumber,
        ),
        appBloc: appBloc,
      );

      result.fold(
        (l) => emit(
          FailedOtpConfirmationProccess(
            message: l.message,
          ),
        ),
        (r) {
          emit(
            SuccessOtpConfirmationProccess(),
          );
        },
      );
    } on Exception catch (e) {
      emit(
        FailedOtpConfirmationProccess(
          message: e.toString(),
        ),
      );
    }
  }

  Future<void> resendOtp() async {
    emit(LoadingOtpConfirmationProccess());

    try {
      var result = await confirmOtpUseCases.resendOtp(
        phone: phoneNumber,
      );

      result.fold(
        (l) => emit(
          FailedOtpConfirmationProccess(
            message: l.message,
          ),
        ),
        (r) {
          emit(
            SuccessresendOtpProccess(),
          );
        },
      );
    } on Exception catch (e) {
      emit(
        FailedOtpConfirmationProccess(
          message: e.toString(),
        ),
      );
    }
  }
}
