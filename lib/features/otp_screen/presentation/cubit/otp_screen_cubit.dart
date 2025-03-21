import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'otp_screen_state.dart';

class OtpScreenCubit extends Cubit<OtpScreenState> {
  OtpScreenCubit() : super(OtpScreenInitial());
}
