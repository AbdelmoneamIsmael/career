import 'package:dio/dio.dart';

abstract class Failure {
  Failure(this.message);
  final String message;
}

class ServerFailure extends Failure {
  ServerFailure(super.message);
  factory ServerFailure.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate with ApiServer');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(error.response!);
      case DioExceptionType.cancel:
        return ServerFailure('Cancel with ApiServer');
      case DioExceptionType.connectionError:
        return ServerFailure(
            'Connection Error From the server ,Try Again Later');
      case DioExceptionType.unknown:
        return ServerFailure("${error.message}");
    }
  }
  factory ServerFailure.fromResponse(Response response) {
    if (response.statusCode == 404) {
      return ServerFailure('Not Found');
    } else if (response.statusCode == 500) {
      return ServerFailure('${response.data}');
    } else if (response.statusCode == 400) {
      return ServerFailure('${response.data}');
    } else if (response.statusCode == 401 || response.statusCode == 403) {
      return ServerFailure(response.toString());
    } else {
      return ServerFailure('Unexpected Error, please try again!');
    }
  }
}

class CashingFailure extends Failure {
  CashingFailure(super.message);
}
