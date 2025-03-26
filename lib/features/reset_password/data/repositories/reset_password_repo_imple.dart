import 'package:career/core/errors/error_class.dart';
import 'package:career/features/reset_password/data/datasources/remote/remote_confirm_reset_by_phone.dart';
import 'package:career/features/reset_password/data/datasources/remote/remote_resete_password.dart';
import 'package:career/features/reset_password/domain/entities/reset_phone_responce.dart';
import 'package:career/features/reset_password/domain/repositories/reset_password_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ResetPasswordRepoImple extends ResetPasswordRepo {
  ResetPasswordRepoImple({
    required this.remoteConfirmResetByPhone,
    required this.remoteResetePassword,
  });

  final RemoteConfirmResetByPhone remoteConfirmResetByPhone;
  final RemoteResetePassword remoteResetePassword;
  @override
  Future<Either<Failure, ResetPassResponce>> confirmPhone(
      {required String phone}) async {
    try {
      var result = await remoteConfirmResetByPhone.confirmResetByPhone(
        phone: phone,
      );
      return Right(result);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, ResetPassResponce>> confirmUpdate({
    required String phone,
    required String otp,
    required String newPassword,
  }) async {
    try {
      var result = await remoteResetePassword.resetPassword(
        phone: phone,
        newPassword: newPassword,
        otp: otp,
      );
      return Right(result);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
