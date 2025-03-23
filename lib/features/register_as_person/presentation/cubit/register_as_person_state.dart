abstract class RegisterAsPersonState {}

class RegisterAsPersonInitial extends RegisterAsPersonState {}

class ChangeProfileImage extends RegisterAsPersonState {}

class ChangePageView extends RegisterAsPersonState {}

class PdfPicked extends RegisterAsPersonState {}

class AddStudy extends RegisterAsPersonState {}

class DeleteStudy extends RegisterAsPersonState {}

class ChangeWorkHereNow extends RegisterAsPersonState {}

class AddWorkExperiance extends RegisterAsPersonState {}

class DeleteWorkExperiance extends RegisterAsPersonState {}

class AddCirtifications extends RegisterAsPersonState {}

class AddLanguage extends RegisterAsPersonState {}

class DeleteLanguage extends RegisterAsPersonState {}

class ChangeAreas extends RegisterAsPersonState {}

class ChangeGovernorate extends RegisterAsPersonState {}

class LoadingPersonRegister extends RegisterAsPersonState {}

class PersonRegisteredSuccess extends RegisterAsPersonState {}

class PersonRegisteredFailed extends RegisterAsPersonState {
  PersonRegisteredFailed(this.message);
  final String message;
}
