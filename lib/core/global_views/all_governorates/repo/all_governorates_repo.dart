import 'package:career/core/errors/error_class.dart';
import 'package:career/core/global_views/all_governorates/model/all_governorates_responce.dart';
import 'package:career/core/utils/api/api_server.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AllGovernoratesRepo {
  ApiServer apiServer = ApiServer();

  Future<Either<Failure, AllGovernoratesResponse>> getAllGovernorates({
    required bool? isPagingEnabled,
    required int? pageIndex,
    required int? pageSize,
    String? sort,
    String? query,
  }) async {
    try {
      
      var result = await apiServer.getRequest(
        uri:
            "/api/Governorates/GetAllGovernorates?isPagingEnabled=$isPagingEnabled&pageIndex=$pageIndex&pageSize=$pageSize${query != null ? query.isEmpty ? "" : " &Search=$query" : ""}",
      );
      AllGovernoratesResponse allGovernoratesResponse = AllGovernoratesResponse.fromJson(result);
      return Right(allGovernoratesResponse);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
