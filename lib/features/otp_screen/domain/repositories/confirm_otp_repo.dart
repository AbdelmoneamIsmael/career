import 'package:career/core/errors/error_class.dart';
import 'package:career/features/otp_screen/data/models/otp_responce_model.dart';
import 'package:career/features/otp_screen/domain/entities/conform_parameters.dart';
import 'package:dartz/dartz.dart';

abstract class ConfirmOtpRepo {
  Future<Either<Failure, OtpResponseModel>> confirmOtp(
      {required ConfirmOtpParameters optPrameters});

  Future<Either<Failure, String>> resendOtp(
      {required String phone});
}
