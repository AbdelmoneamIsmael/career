import 'package:career/core/const/app_const.dart';
import 'package:career/core/routes/page_routes.dart';
import 'package:career/core/routes/pages_keys.dart';
import 'package:career/core/utils/api/api_server.dart';
import 'package:career/core/utils/cache_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class DioInterceptors extends Interceptor {
  DioInterceptors({
    required this.dio,
  });
  Dio dio;
  Logger logger = Logger(
      printer: PrettyPrinter(methodCount: 0, colors: true, printEmojis: true));

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    final options = err.requestOptions;
    final requestPath = '${options.baseUrl}${options.path}';
    logger.e('${options.method} request ==> $requestPath'); //Error log
    logger.d('Error type: ${err.error} \n '
        'Error message: ${err.message}'); //Debug log
    if (err.response?.statusCode == 401 || err.response?.statusCode == 403) {
      String token = await refreshToken();
      if (token.isNotEmpty) {
        err.requestOptions.headers["Authorization"] = "Bearer $token";

        try {
          final newResponse = await dio.fetch(err.requestOptions);
          return handler.resolve(newResponse);
        } catch (e) {
          PageRoutes.router.go(PagesKeys.onBoardingScreen);
          return handler.next(err);
        }
      } else {
        PageRoutes.router.go(PagesKeys.onBoardingScreen);
        return handler.next(err);
      }
    }

    handler.next(err); //Continue with the Error
  }

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final requestPath = options.path;
    String? token =
        await CacheHelper.getSecuerString(key: StorageKeys.accessToken);
    options.headers["Authorization"] = "Bearer $token";
    options.headers["Accept-Language"] = "ar-EG";

    logger.i('${options.method} request ==> $requestPath'); //Info log
    handler.next(options); // continue with the Request
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.d('STATUSCODE: ${response.statusCode} \n '
        'STATUSMESSAGE: ${response.statusMessage} \n'
        'HEADERS: ${response.headers} \n'
        'Data: ${response.data}'); // Debug log
    handler.next(response); // continue with the Response
  }

  Future<String> refreshToken() async {
    try {
      String? accessToken =
          await CacheHelper.getSecuerString(key: StorageKeys.accessToken);
      String refreshToken =
          await CacheHelper.getSecuerString(key: StorageKeys.refreshToken);
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $accessToken",
        'Cookie': 'refreshToken=$refreshToken',
      };
      String url = "api/Authentication/RefreshToken";
      dio.options.headers = headers;
      var response = await dio.get(
        url,
      );

      if (response.statusCode == 200) {
        await CacheHelper.setSecuerString(
            key: StorageKeys.accessToken, value: response.data["token"]);
        return response.data["token"];
      } else {
        await CacheHelper.setSecuerString(
            key: StorageKeys.accessToken, value: "");
        await CacheHelper.setSecuerString(
            key: StorageKeys.refreshToken, value: "");

        PageRoutes.router.go(PagesKeys.onBoardingScreen);
        return "";
      }
    } on Exception catch (e) {
      debugPrint(e.toString());

      // PageRoutes.router.go(PagesKeys.loginPage);
      // rethrow;
      return "";
    }
  }
}
