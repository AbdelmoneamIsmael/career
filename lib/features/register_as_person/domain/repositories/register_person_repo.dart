import 'package:career/core/errors/error_class.dart';
import 'package:career/features/register_as_person/domain/entities/register_input_model.dart';
import 'package:career/features/register_as_person/domain/entities/register_person_responce.dart';
import 'package:dartz/dartz.dart';

abstract class RegisterPersonRepo {
  Future<Either<Failure, RegisterPersonResponce>> register(
    RegisterPersonModel registerInputModel,
  );
}
