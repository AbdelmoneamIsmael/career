import 'package:career/core/const/app_const.dart';
import 'package:career/core/errors/error_class.dart';
import 'package:career/core/utils/cache_helper.dart';
import 'package:career/features/business_login/data/datasources/remote_login.dart';
import 'package:career/features/business_login/data/models/login_response_model.dart';
import 'package:career/features/business_login/domain/entities/login.dart';
import 'package:career/features/business_login/domain/repositories/login_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class LoginRepoImple extends LoginRepo {
  LoginRepoImple({required this.remoteLogin});

  final RemoteLogin remoteLogin;
  @override
  Future<Either<Failure, LoginResponseModel>> login(
      {required LoginPrameters loginPrameters}) async {
    try {
      LoginResponseModel results =
          await remoteLogin.login(loginPrameters: loginPrameters);

      return Right(results);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
