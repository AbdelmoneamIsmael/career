import 'package:bloc/bloc.dart';
import 'package:career/core/bloc/app_bloc.dart';
import 'package:career/core/routes/pages_keys.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit({
    required this.context,
    required this.path,
  }) : super(MainInitial()) {
    currentIndex = 0;
  }
  String path = "";
  int currentIndex = 0;
  final BuildContext context;
  Future<void> changeIndex(int index) async {
    if (index != currentIndex) {
      currentIndex = index;
      switch (index) {
        case 0:
          path = "/${PagesKeys.mainScreen}/${PagesKeys.homeScreen}";
          context.go(
            path,
          );

          getIndex(pagePath: path);
          break;
        case 1:
          path =
              "/${PagesKeys.mainScreen}/${PagesKeys.profileScreen}?id=${BlocProvider.of<AppBloc>(context).loginInfo!.personId}";
          // js.context
          //       .callMethod('open', ['https://stackoverflow.com/questions/ask']);
          context.go(
            path,
          );

          getIndex(pagePath: path);
          break;
        case 2:
          path = "/${PagesKeys.mainScreen}/${PagesKeys.notificationspage}";
          context.go(
            path,
          );

          getIndex(pagePath: path);
          break;
        case 3:
          path = "/${PagesKeys.mainScreen}/${PagesKeys.settingsScreen}";
          context.go(
            path,
          );

          getIndex(pagePath: path);
          break;
      }
    }
  }

  getIndex({required String pagePath}) {
    emit(CheekingIndex());
    if (pagePath == "/${PagesKeys.mainScreen}/${PagesKeys.homeScreen}") {
      currentIndex = 0;
    } else if (pagePath ==
        "/${PagesKeys.mainScreen}/${PagesKeys.profileScreen}") {
      currentIndex = 1;
    } else if (pagePath ==
        "/${PagesKeys.mainScreen}/${PagesKeys.notificationspage}") {
      currentIndex = 2;
    } else if (pagePath ==
        "/${PagesKeys.mainScreen}/${PagesKeys.settingsScreen}") {
      currentIndex = 3;
    } else {
      currentIndex = 0;
    }
    emit(ChangeIndex());
  }
}
