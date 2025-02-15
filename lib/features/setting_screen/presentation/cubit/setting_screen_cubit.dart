import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'setting_screen_state.dart';

class SettingScreenCubit extends Cubit<SettingScreenState> {
  SettingScreenCubit() : super(SettingScreenInitial());
}
