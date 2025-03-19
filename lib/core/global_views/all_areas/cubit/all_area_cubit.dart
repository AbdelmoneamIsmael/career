import 'package:bloc/bloc.dart';
import 'package:career/core/const/enums.dart';
import 'package:career/core/global_views/all_areas/cubit/all_area_state.dart';
import 'package:career/core/global_views/all_areas/model/all_area_responce.dart';
import 'package:career/core/global_views/all_areas/repo/all_area_repo.dart';
import 'package:flutter/material.dart';

class AllAreasCubit extends Cubit<AllAreasState> {
  AllAreasCubit(
    this.allAreasRepo,
    this.governorateId,
  ) : super(AllAreasInitial());
  ScrollController scrollController = ScrollController();
  bool isThereMoreItems = true;
  int pageIndex = 1;
  AllAreasRepo allAreasRepo;
  String query = '';
  List<Areas> allAreas = [];
  final int governorateId;

  @override
  Future<void> close() {
    scrollController.dispose();
    return super.close();
  }

  onInit() {
    getAllAllAreas();
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (scrollController.hasClients) {
      double currentPosition = scrollController.position.pixels;
      double maxScrollExtent = scrollController.position.maxScrollExtent;
      double seventyPercentOffset = maxScrollExtent * 0.7;

      if (currentPosition >= seventyPercentOffset &&
          state is! AllAreasLoading &&
          isThereMoreItems) {
        getAllAllAreas();
      }
    }
  }

  void getAllAllAreas() async {
    try {
      emit(AllAreasLoading());
      allAreasRepo
          .getAllAreas(
            governorateId: governorateId,
            isPagingEnabled: true,
            pageIndex: pageIndex,
            pageSize: 20,
            query: query,
            sort: null,
          )
          .then(
            (value) => value.fold(
              (l) => emit(AllAreasError(l.message)),
              (r) {
                isThereMoreItems = r.data.length == 10;
                allAreas.addAll(r.data);
                emit(
                  SuccessGettingAllAreas(),
                );
              },
            ),
          );
    } catch (e) {
      emit(
        AllAreasError(
          e.toString(),
        ),
      );
    }
  }

  void refresh(String value) {
    query = value;
    pageIndex = 1;
    allAreas = [];
    getAllAllAreas();
  }
}
