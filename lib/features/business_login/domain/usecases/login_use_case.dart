import 'package:career/core/bloc/app_bloc.dart';
import 'package:career/core/errors/error_class.dart';
import 'package:career/features/business_login/data/models/login_response_model.dart';
import 'package:career/features/business_login/domain/entities/login.dart';
import 'package:career/features/business_login/domain/repositories/login_repo.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase {
  LoginUseCase({required this.loginRepo});
  final LoginRepo loginRepo;

  Future<Either<Failure, LoginResponseModel>> call({
    required LoginPrameters loginPrameters,
    required AppBloc bloc,
  }) async {
    var results = await loginRepo.login(
      loginPrameters: loginPrameters,
    );
    return results;
   
  }
}
