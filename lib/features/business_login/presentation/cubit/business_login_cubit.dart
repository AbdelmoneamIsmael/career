import 'package:bloc/bloc.dart';
import 'package:career/core/routes/pages_keys.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

part 'business_login_state.dart';

class BusinessLoginCubit extends Cubit<BusinessLoginState> {
  BusinessLoginCubit() : super(BusinessLoginInitial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
    
  }

  void login({
    required BuildContext context,
  }) {
    if (formKey.currentState!.validate()) {
      savePassword(context);
    }
  }

  ///
  ///
  ///save password and email and go to the next screen
  ///
  ///
  void savePassword(BuildContext context) {
    TextInput.finishAutofillContext();

    if (context.mounted) {
      GoRouter.of(context)
          .push("/${PagesKeys.mainScreen}/${PagesKeys.homeScreen}");
    }
  }
}
