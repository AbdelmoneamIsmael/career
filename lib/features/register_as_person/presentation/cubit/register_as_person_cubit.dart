import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_as_person_state.dart';

class RegisterAsPersonCubit extends Cubit<RegisterAsPersonState> {
  RegisterAsPersonCubit() : super(RegisterAsPersonInitial());
}
