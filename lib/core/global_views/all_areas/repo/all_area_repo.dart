import 'package:career/core/errors/error_class.dart';
import 'package:career/core/global_views/all_areas/model/all_area_responce.dart';
import 'package:career/core/utils/api/api_server.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AllAreasRepo {
  ApiServer apiServer = ApiServer();

  Future<Either<Failure, AllAreasResponse>> getAllAreas({
    required bool? isPagingEnabled,
    required int? pageIndex,
    required int? governorateId,
    required int? pageSize,
    String? sort,
    String? query,
  }) async {
    try {
      var result = await apiServer.getRequest(
        uri:
            "/api/Areas/GetAllAreas?GovernorateId=$governorateId&isPagingEnabled=$isPagingEnabled&pageIndex=$pageIndex&pageSize=$pageSize${query != null ? query.isEmpty ? "" : " &Search=$query" : ""}",
      );
      AllAreasResponse allAreasResponse = AllAreasResponse.fromJson(result);
      return Right(allAreasResponse);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
