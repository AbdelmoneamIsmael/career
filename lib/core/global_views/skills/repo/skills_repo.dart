import 'package:career/core/errors/error_class.dart';
import 'package:career/core/global_views/skills/model/skills_responce.dart';
import 'package:career/core/utils/api/api_server.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SkillsRepo {
  ApiServer apiServer = ApiServer();

  Future<Either<Failure, SkillsResponse>> getSkills({
    required bool? isPagingEnabled,
    required int? pageIndex,
    required int? pageSize,
    String? sort,
    String? query,
  }) async {
    try {
      
      var result = await apiServer.getRequest(
        uri:
            "/api/Skills/GetAllSkills?isPagingEnabled=$isPagingEnabled&pageIndex=$pageIndex&pageSize=$pageSize${query != null ? query.isEmpty ? "" : " &Search=$query" : ""}",
      );
      SkillsResponse skillsResponse = SkillsResponse.fromJson(result);
      return Right(skillsResponse);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
