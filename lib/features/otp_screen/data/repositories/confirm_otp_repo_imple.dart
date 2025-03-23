import 'package:career/core/errors/error_class.dart';
import 'package:career/features/otp_screen/data/datasources/confirm_otp_remote.dart';
import 'package:career/features/otp_screen/data/models/otp_responce_model.dart';
import 'package:career/features/otp_screen/domain/entities/conform_parameters.dart';
import 'package:career/features/otp_screen/domain/repositories/confirm_otp_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ConfirmOtpRepoImple extends ConfirmOtpRepo {
  ConfirmOtpRepoImple(
      {required this.confirmOtpRemote, required this.resendOtpRemote});

  final ConfirmOtpRemote confirmOtpRemote;
  final ResendOtpRemote resendOtpRemote;
  @override
  Future<Either<Failure, OtpResponseModel>> confirmOtp(
      {required ConfirmOtpParameters optPrameters}) async {
    try {
      var result = await confirmOtpRemote.confirmOtp(
        optPrameters: optPrameters,
      );
      return Right(result);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, String>> resendOtp({required String phone}) async {
    try {
      var result = await resendOtpRemote.resendOtp(
        phone: phone,
      );
      return Right(result);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
