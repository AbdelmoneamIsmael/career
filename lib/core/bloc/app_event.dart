import 'package:career/core/const/enums.dart';

abstract class AppEvent {}

class AppInitEvent extends AppEvent {}

class ChangeLanguageEvent extends AppEvent {
  ChangeLanguageEvent();
}

class ChangeThemeEvent extends AppEvent {
  ChangeThemeEvent();
}

class VistorEvent extends AppEvent {
  VistorEvent({required this.vistor});
  final VisitorType vistor;
}
class LogOutEvent extends AppEvent {}
