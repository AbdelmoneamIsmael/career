import 'package:bloc/bloc.dart';
import 'package:career/features/profile_screen/presentation/cubit/profile_screen_state.dart';

class ProfileScreenCubit extends Cubit<ProfileScreenState> {
  ProfileScreenCubit(
    {
      required this.personId,
    }
  ) : super(ProfileScreenInitial());
  final String personId;
}
