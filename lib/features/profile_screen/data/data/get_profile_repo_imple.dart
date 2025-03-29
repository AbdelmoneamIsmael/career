import 'package:career/core/errors/error_class.dart';
import 'package:career/features/profile_screen/data/remote/remote_profile.dart';
import 'package:career/features/profile_screen/domain/entity/profile_person.dart';
import 'package:career/features/profile_screen/domain/repo/get_person_details_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class GetProfileRepoImple extends GetPersonDetailsRepo {
  GetProfileRepoImple({required this.remoteProfile});

  final RemoteProfile remoteProfile;
  @override
  Future<Either<Failure, ProfilePersonModel>> getPersonDetails({
    required String userId,
  }) async {
    try {
      var result = await remoteProfile.getProfile(
        userId,
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
