import 'package:bloc/bloc.dart';
import 'package:career/core/app_texts/app_localizations.dart';
import 'package:career/features/home_screen/presentation/cubit/home_screen_state.dart';
import 'package:flutter/material.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit({required this.context}) : super(HomeScreenInitial());

  final BuildContext context;
  List<String> jobs = [];
  late String selectedJob;
  List<String> searchFor = [];
  late String selectedSearchFor;
  onInit() {
    jobs = [
      AppLocalizations.of(context).fullTime,
      AppLocalizations.of(context).remote,
      AppLocalizations.of(context).partTime,
    ];
    searchFor = [
      AppLocalizations.of(context).post,
      AppLocalizations.of(context).company,
      AppLocalizations.of(context).person,
    ];
    selectedSearchFor = searchFor[0];
    selectedJob = jobs[0];
  }

  void changeJopKind(String? value) {
    selectedJob = value!;
    emit(ChangeJopKind());
  }
  void changeSearchFor(String? value) {
    selectedSearchFor = value!;
    emit(ChangeSearchFor());
  }
}
