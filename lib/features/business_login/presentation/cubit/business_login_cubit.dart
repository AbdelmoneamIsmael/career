import 'package:bloc/bloc.dart';
import 'package:career/core/bloc/app_bloc.dart';
import 'package:career/core/const/app_const.dart';
import 'package:career/core/routes/pages_keys.dart';
import 'package:career/features/business_login/domain/entities/login.dart';
import 'package:career/features/business_login/domain/repositories/login_repo.dart';
import 'package:career/features/business_login/domain/usecases/login_use_case.dart';
import 'package:career/features/business_login/presentation/cubit/business_login_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class BusinessLoginCubit extends Cubit<BusinessLoginState> {
  BusinessLoginCubit({
    required this.loginUseCase,
    required this.appBloc,
  }) : super(BusinessLoginInitial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final LoginUseCase loginUseCase;
  final AppBloc appBloc;
  final formKey = GlobalKey<FormState>();
  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }

  void login({
    required BuildContext context,
  }) async {
    if (formKey.currentState!.validate()) {
      await excuteLogin();
      savePassword(context);
    }
  }

  Future<void> excuteLogin() async {
    emit(LoadingLoginProcess());
    try {
      var result = await loginUseCase.call(
        loginPrameters: LoginPrameters(
          email: emailController.text,
          password: passwordController.text,
          fcmToken: kDeviceToken,
        ),
        bloc: appBloc,
      );
      result.fold((l) => emit(ErrorLogin(message: l.message)), (r) {
        emit(
          SuccessLogin(
            loginResponseModel: r,
          ),
        );
      });
    } on Exception catch (e) {
      emit(ErrorLogin(message: e.toString()));
    }
  }

  ///
  ///
  ///save password and email and go to the next screen
  ///
  ///
  void savePassword(BuildContext context) {
    TextInput.finishAutofillContext();
  }
}
