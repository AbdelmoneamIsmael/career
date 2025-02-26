import 'package:bloc/bloc.dart';
import 'package:career/core/app_texts/app_localizations.dart';
import 'package:career/features/create_post/presentation/cubit/create_post_state.dart';
import 'package:flutter/material.dart';

class CreatePostCubit extends Cubit<CreatePostState> {
  CreatePostCubit(
    {
      required this.context,
    }
  ) : super(CreatePostInitial());
  final BuildContext context;
  List<String> jobs = [];
  late String selectedJob;
  
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
   
    experience = [
      AppLocalizations.of(context).noExperience,
      AppLocalizations.of(context).entryLevel,
      AppLocalizations.of(context).junior,
      AppLocalizations.of(context).middle,
      AppLocalizations.of(context).senior,
    ];
   
    selectedJob = jobs[0];
    selectedExperience = experience[0];
  }

  void changeJopKind(String? value) {
    selectedJob = value!;
    emit(ChangePostJopKind());
  }

 

  void changeExperience(String? value) {
    selectedExperience = value!;
    emit(ChangePostExperience());
  }
}
