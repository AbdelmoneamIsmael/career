import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'register_as_person_state.dart';

class RegisterAsPersonCubit extends Cubit<RegisterAsPersonState> {
  RegisterAsPersonCubit() : super(RegisterAsPersonInitial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void register() {
    if (formKey.currentState!.validate()) {
      print('register');
    }
  }
}
