import 'package:career/core/errors/error_class.dart';
import 'package:career/features/profile_screen/domain/entity/profile_person.dart';
import 'package:dartz/dartz.dart';

abstract class GetPersonDetailsRepo {
  Future<Either<Failure, ProfilePersonModel>> getPersonDetails(
      {required String userId,});
  
}
