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
  List<String> experience = [];
  late String selectedExperience;
  List<double> sallary = [
    0,
    300,
    500,
    700,
    900,
    1100,
    1300,
    1500,
    1700,
    1900,
    2100,
    2300,
    2500,
    2700,
    2900,
    5000,
    999999,
  ];
  double selectedSallary = 0;
  double selectedSallaryEnd = 999999;
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
    experience = [
      AppLocalizations.of(context).noExperience,
      AppLocalizations.of(context).entryLevel,
      AppLocalizations.of(context).junior,
      AppLocalizations.of(context).middle,
      AppLocalizations.of(context).senior,
    ];
    selectedSearchFor = searchFor[0];
    selectedJob = jobs[0];
    selectedExperience = experience[0];
  }

  void changeJopKind(String? value) {
    selectedJob = value!;
    emit(ChangeJopKind());
  }

  void changeSearchFor(String? value) {
    selectedSearchFor = value!;
    emit(ChangeSearchFor());
  }

  void changeExperience(String? value) {
    selectedExperience = value!;
    emit(ChangeSearchFor());
  }
}
