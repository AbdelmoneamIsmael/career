import 'package:career/features/register_as_business/presentation/manager/business_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterAsBusinessCubit extends Cubit<RegisterBusinessState> {
  RegisterAsBusinessCubit() : super(BusinessInitial());
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
