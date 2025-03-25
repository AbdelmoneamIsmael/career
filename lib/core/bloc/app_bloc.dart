import 'dart:convert';
import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:career/core/bloc/app_event.dart';
import 'package:career/core/const/enums.dart';
import 'package:career/features/otp_screen/data/models/otp_responce_model.dart';
import 'package:flutter/material.dart';
import 'package:career/core/bloc/app_state.dart';
import 'package:career/core/const/app_const.dart';
import 'package:career/core/model/app_model/app_model.dart';
import 'package:career/core/themes/theme/custom_theme.dart';
import 'package:career/core/utils/cache_helper.dart';
import 'package:hive/hive.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitial()) {
    on<AppEvent>((event, emit) {
      if (event is ChangeThemeEvent) {
        changeTheme();
        emit(ChangeThemeState());
      } else if (event is ChangeLanguageEvent) {
        changeLanguage();
        emit(ChangeLanguageState());
      } else if (event is AppInitEvent) {
        emit(AppLoaded());
      }
      if (event is VistorEvent) {
        visitorType = event.vistor;
        emit(ChangeIngVisitorType());
      }
    });
    onInit();
  }
  VisitorType visitorType = VisitorType.guest;
  LoginInfo? loginInfo;

  ApplicationModel appModel = ApplicationModel(
    theme: ApplicationTheme.dark,
    language: ApplicationLanguage.en,
    applicationName: kAppName,
    fontFamily: kFontFamily,
  );

  void onInit() {
    CacheHelper.getData(key: 'applicationModel') != null
        ? appModel = appModel
            .fromJson(jsonDecode(CacheHelper.getData(key: 'applicationModel')))
        : appModel = ApplicationModel(
            theme: ApplicationTheme.dark,
            language: window.locale.languageCode == 'ar'
                ? ApplicationLanguage.ar
                : ApplicationLanguage.en,
            applicationName: kAppName,
            fontFamily: kFontFamily,
          );

    var box = Hive.box<LoginInfo>(StorageKeys.loginInfo);
    loginInfo = box.values.first;
    if (loginInfo != null) {
      if (loginInfo!.roles.contains("Admin")) {
        add(
          VistorEvent(
            vistor: VisitorType.admin,
          ),
        );
      } else if (loginInfo!.roles.contains("Business")) {
        add(
          VistorEvent(
            vistor: VisitorType.business,
          ),
        );
      } else if (loginInfo!.roles.contains("Person")) {
        add(
          VistorEvent(
            vistor: VisitorType.person,
          ),
        );
      } else {
        add(
          VistorEvent(
            vistor: VisitorType.guest,
          ),
        );
      }
    }
  }

  changeTheme() {
    switch (appModel.theme) {
      case ApplicationTheme.light:
        appModel.theme = ApplicationTheme.dark;
        appModel.fontFamily = kFontFamily;
        break;
      case ApplicationTheme.dark:
        appModel.theme = ApplicationTheme.light;
        break;
    }
    final jsonString = jsonEncode(appModel.toJson());
    CacheHelper.saveData(key: 'applicationModel', value: jsonString);
  }

  changeLanguage() {
    switch (appModel.language) {
      case ApplicationLanguage.ar:
        appModel.language = ApplicationLanguage.en;

        appModel.fontFamily = kFontFamily;
        break;
      case ApplicationLanguage.en:
        appModel.language = ApplicationLanguage.ar;

        appModel.fontFamily = kFontFamily;
        break;
    }

    final jsonString = jsonEncode(appModel.toJson());

    CacheHelper.saveData(key: 'applicationModel', value: jsonString);
  }

  ThemeData getTheme() {
    switch (appModel.theme) {
      case ApplicationTheme.light:
        return lightTheme;
      case ApplicationTheme.dark:
        return darkTheme;
    }
  }
}
