import 'package:career/features/profile_screen/domain/entity/profile_person.dart';

abstract class ProfileScreenState {}

class ProfileScreenInitial extends ProfileScreenState {}

class ProfileScreenLoading extends ProfileScreenState {}

class ProfileScreenError extends ProfileScreenState {
  ProfileScreenError({required this.message});
  final String message;
}

class ProfileScreenSuccess extends ProfileScreenState {
  ProfileScreenSuccess({required this.profilePersonModel});
  ProfilePersonModel profilePersonModel;
}
