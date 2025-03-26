import 'package:career/core/errors/error_class.dart';
import 'package:career/features/reset_password/domain/entities/reset_phone_responce.dart';
import 'package:dartz/dartz.dart';

abstract class ResetPasswordRepo {
  Future<Either<Failure, ResetPassResponce>> confirmPhone({
    required String phone,
  });
  Future<Either<Failure, ResetPassResponce>> confirmUpdate({
    required String phone,
    required String otp,
    required String newPassword,
  });
}
