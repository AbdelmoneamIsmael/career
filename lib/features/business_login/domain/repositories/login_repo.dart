import 'package:career/core/errors/error_class.dart';
import 'package:career/features/business_login/data/models/login_response_model.dart';
import 'package:career/features/business_login/domain/entities/login.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepo {
  Future<Either <Failure, LoginResponseModel>> login({
required LoginPrameters loginPrameters,
  });
}