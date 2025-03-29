import 'package:bloc/bloc.dart';
import 'package:career/features/reset_password/domain/repositories/reset_password_repo.dart';
import 'package:career/features/reset_password/presentation/cubit/reset_password_state.dart';
import 'package:flutter/material.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit({
    required this.resetPasswordRepo,
  }) : super(ResetPasswordInitial());
  final ResetPasswordRepo resetPasswordRepo;
  final pageController = PageController(initialPage: 0);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String countryCode = '+964';
  String otp = "";
  @override
  Future<void> close() {
    pageController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    return super.close();
  }

  Future<void> validatePhone() async {
    if (phoneController.text.isNotEmpty) {
      emit(LoadingCheckPhoneState());
      try {
        var result = await resetPasswordRepo.confirmPhone(
            phone: countryCode + phoneController.text);
        result.fold((f) {
          emit(ErrorCheckPhoneState(message: f.message));
        }, (r) {
          pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.linear,
          );
          emit(SuccessCheckPhoneState());
        });
      } catch (e) {
        emit(ErrorCheckPhoneState(message: e.toString()));
      }
    }
  }

  Future<void> passWordValidate() async {
    if (formKey.currentState!.validate() &&
        passwordController.text == confirmPasswordController.text) {
      if (phoneController.text.isNotEmpty) {
        emit(LoadingChangePasswordState());
        try {
          var result = await resetPasswordRepo.confirmUpdate(
              phone: countryCode + phoneController.text,
              otp: otp,
              newPassword: passwordController.text);
          result.fold((f) {
            emit(ErrorChangePasswordState(message: f.message));
          }, (r) {
            emit(SuccessChangePasswordState());
          });
        } catch (e) {
          emit(ErrorChangePasswordState(message: e.toString()));
        }
      }
    }
  }

  void submitOtp(value) {
    otp = value;
  }
}
