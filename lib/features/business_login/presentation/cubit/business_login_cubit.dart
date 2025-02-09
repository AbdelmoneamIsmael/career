import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'business_login_state.dart';

class BusinessLoginCubit extends Cubit<BusinessLoginState> {
  BusinessLoginCubit() : super(BusinessLoginInitial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void login() {
    if (formKey.currentState!.validate()) {
      print('login');
      TextInput.finishAutofillContext();
    }
  }
}
