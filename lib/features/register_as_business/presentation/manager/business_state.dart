abstract class RegisterBusinessState {}

class BusinessInitial extends RegisterBusinessState {}

class ChangePageView extends RegisterBusinessState {}

class ChangeCompanyImage extends RegisterBusinessState {}

class AddSpeacialization extends RegisterBusinessState {}

class RemoveSpeacialization extends RegisterBusinessState {}

class ChangeGovernorate extends RegisterBusinessState {}

class ChangeAreas extends RegisterBusinessState {}

class AddAddress extends RegisterBusinessState {}

class DeleteAddress extends RegisterBusinessState {}

class LoadingRegister extends RegisterBusinessState {}

class ErrorRegister extends RegisterBusinessState {
  ErrorRegister(this.error);
  final String error;
}

class SuccessRegister extends RegisterBusinessState {}
