import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'register_as_person_state.dart';

class RegisterAsPersonCubit extends Cubit<RegisterAsPersonState> {
  RegisterAsPersonCubit() : super(RegisterAsPersonInitial());
  //global variabels
  PageController controller = PageController(
    initialPage: 0,
  );
  int currentPage = 0;

  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }

  void setVAlue(int value) {
    currentPage = value;
    emit(ChangePageView());
  }
}
