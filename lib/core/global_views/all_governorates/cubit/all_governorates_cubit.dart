import 'package:bloc/bloc.dart';

import 'package:career/core/global_views/all_governorates/cubit/all_governorates_state.dart';
import 'package:career/core/global_views/all_governorates/model/all_governorates_responce.dart';
import 'package:career/core/global_views/all_governorates/repo/all_governorates_repo.dart';
import 'package:flutter/material.dart';

class AllGovernoratesCubit extends Cubit<AllGovernoratesState> {
  AllGovernoratesCubit(
    this.allGovernoratesRepo,
  ) : super(AllGovernoratesInitial());
  ScrollController scrollController = ScrollController();
  bool isThereMoreItems = true;
  int pageIndex = 1;
  AllGovernoratesRepo allGovernoratesRepo;
  String query = '';
  List<Governerates> allGovernorates = [];

  @override
  Future<void> close() {
    scrollController.dispose();
    return super.close();
  }

  onInit() {
    print('init');
    getAllAllGovernorates();
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (scrollController.hasClients) {
      double currentPosition = scrollController.position.pixels;
      double maxScrollExtent = scrollController.position.maxScrollExtent;
      double seventyPercentOffset = maxScrollExtent * 0.7;

      if (currentPosition >= seventyPercentOffset &&
          state is! AllGovernoratesLoading &&
          isThereMoreItems) {
        getAllAllGovernorates();
      }
    }
  }

  void getAllAllGovernorates() async {
    try {
      emit(AllGovernoratesLoading());
      allGovernoratesRepo
          .getAllGovernorates(
            isPagingEnabled: true,
            pageIndex: pageIndex,
            pageSize: 20,
            query: query,
            sort: null,
          )
          .then(
            (value) => value.fold(
              (l) => emit(AllGovernoratesError(l.message)),
              (r) {
                isThereMoreItems = r.data.length == 10;
                allGovernorates.addAll(r.data);
                emit(
                  SuccessGettingAllGovernorates(),
                );
              },
            ),
          );
    } catch (e) {
      emit(
        AllGovernoratesError(
          e.toString(),
        ),
      );
    }
  }

  void refresh(String value) {
    query = value;
    pageIndex = 1;
    allGovernorates = [];
    getAllAllGovernorates();
  }
}
