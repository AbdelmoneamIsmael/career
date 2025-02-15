import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'notification_screen_state.dart';

class NotificationScreenCubit extends Cubit<NotificationScreenState> {
  NotificationScreenCubit() : super(NotificationScreenInitial());
}
