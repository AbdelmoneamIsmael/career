import 'package:bloc/bloc.dart';
import 'package:career/core/global_views/skills/cubit/skills_state.dart';
import 'package:career/core/global_views/skills/model/skills_responce.dart';
import 'package:career/core/global_views/skills/repo/skills_repo.dart';
import 'package:flutter/material.dart';

class SkillsCubit extends Cubit<SkillsState> {
  SkillsCubit(
    this.skillsRepo,
  ) : super(SkillsInitial());
  ScrollController scrollController = ScrollController();
  bool isThereMoreItems = true;
  int pageIndex = 1;
  SkillsRepo skillsRepo;
  String query = '';
  List<Skill> skills = [];

  @override
  Future<void> close() {
    scrollController.dispose();
    return super.close();
  }

  onInit() {
    print('init');
    getAllSkills();
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (scrollController.hasClients) {
      double currentPosition = scrollController.position.pixels;
      double maxScrollExtent = scrollController.position.maxScrollExtent;
      double seventyPercentOffset = maxScrollExtent * 0.7;

      if (currentPosition >= seventyPercentOffset &&
          state is! SkillsLoading &&
          isThereMoreItems) {
        getAllSkills();
      }
    }
  }

  void getAllSkills() async {
    try {
      emit(SkillsLoading());
      skillsRepo
          .getSkills(
            isPagingEnabled: true,
            pageIndex: pageIndex,
            pageSize: 20,
            query: query,
            sort: null,
          )
          .then(
            (value) => value.fold(
              (l) => emit(SkillsError(l.message)),
              (r) {
                isThereMoreItems = r.data.length == 10;
                skills.addAll(r.data);
                emit(
                  SuccessGettingSkills(),
                );
              },
            ),
          );
    } catch (e) {
      emit(
        SkillsError(
          e.toString(),
        ),
      );
    }
  }

  void refresh(String value) {
    query = value;
    pageIndex = 1;
    skills = [];
    getAllSkills();
  }
}
