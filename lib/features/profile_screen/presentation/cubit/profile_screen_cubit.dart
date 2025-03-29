import 'package:bloc/bloc.dart';
import 'package:career/features/profile_screen/domain/entity/profile_person.dart';
import 'package:career/features/profile_screen/domain/repo/get_person_details_repo.dart';
import 'package:career/features/profile_screen/presentation/cubit/profile_screen_state.dart';

class ProfileScreenCubit extends Cubit<ProfileScreenState> {
  ProfileScreenCubit({
    required this.personId,
    required this.getPersonDetailsRepo,
  }) : super(ProfileScreenInitial()) {
    getPersonDetails();
  }
  final String personId;
  final GetPersonDetailsRepo getPersonDetailsRepo;

  ProfilePersonModel? profilePersonModel;

  Future<void> getPersonDetails() async {
    emit(ProfileScreenLoading());
    try {
      var result =
          await getPersonDetailsRepo.getPersonDetails(userId: personId);
      result.fold((f) {
        emit(ProfileScreenError(message: f.message));
      }, (r) {
        profilePersonModel = r;
        emit(ProfileScreenSuccess(
          profilePersonModel: r,
        ));
      });
    } on Exception catch (e) {
      emit(ProfileScreenError(message: e.toString()));
    }
  }
}
