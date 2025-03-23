import 'package:career/core/errors/error_class.dart';
import 'package:career/features/register_as_person/data/datasources/remote_persone_register.dart';
import 'package:career/features/register_as_person/domain/entities/register_input_model.dart';
import 'package:career/features/register_as_person/domain/entities/register_person_responce.dart';
import 'package:career/features/register_as_person/domain/repositories/register_person_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class RegisterPersonRepoImple extends RegisterPersonRepo {
  RegisterPersonRepoImple({required this.remotePersoneRegister});

  final RemotePersoneRegister remotePersoneRegister;

  @override
  Future<Either<Failure, RegisterPersonResponce>> register(
    RegisterPersonModel registerInputModel,
  ) async {
    try {
      var result = await remotePersoneRegister.regesterPerson(
        registerInputModel: registerInputModel,
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
