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

  void login({
    required BuildContext context,
  }) {
    if (formKey.currentState!.validate()) {
      TextInput.finishAutofillContext();
      if (context.mounted) {
        GoRouter.of(context)
            .push("/${PagesKeys.mainScreen}/${PagesKeys.homeScreen}");
      }
    }
  }
}
