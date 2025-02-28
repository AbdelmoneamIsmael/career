import 'package:bloc/bloc.dart';
import 'package:career/features/onboarding/presentation/cubit/main_screen_state.dart';

class OnBoarding extends Cubit<MainScreenState> {
  OnBoarding() : super(MainScreenInitial());
}
