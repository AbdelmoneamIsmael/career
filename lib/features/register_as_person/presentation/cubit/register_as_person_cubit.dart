import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'register_as_person_state.dart';

class RegisterAsPersonCubit extends Cubit<RegisterAsPersonState> {
  RegisterAsPersonCubit() : super(RegisterAsPersonInitial());
  //global variabels
  PageController pageController = PageController(
    initialPage: 0,
  );
  int currentPage = 0;

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }

  void setVAlue(int value) {
    currentPage = value;
    emit(ChangePageView());
  }

  void next() {
    if (pageController.hasClients) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInCirc,
      );
    }
  }

  void previous() {
    if (pageController.hasClients) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInCirc,
      );
    }
  }
}
