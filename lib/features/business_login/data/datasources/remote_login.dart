import 'package:career/core/utils/api/api_server.dart';
import 'package:career/features/business_login/data/models/login_response_model.dart';
import 'package:career/features/business_login/domain/entities/login.dart';

class RemoteLogin {
  ApiServer apiServer = ApiServer();
  Future<LoginResponseModel> login({
    required LoginPrameters loginPrameters,
  }) async {
    var result = await apiServer.post(
      endPoint: "/api/Authentication/token",
      data: loginPrameters.toJson(),
    );
    LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(result);
    return loginResponseModel;
  }
}
