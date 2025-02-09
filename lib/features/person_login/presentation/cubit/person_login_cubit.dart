import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'person_login_state.dart';

class PersonLoginCubit extends Cubit<PersonLoginState> {
  PersonLoginCubit() : super(PersonLoginInitial());
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
