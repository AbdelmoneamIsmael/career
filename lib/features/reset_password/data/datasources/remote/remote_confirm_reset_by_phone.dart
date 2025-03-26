import 'package:career/core/utils/api/api_server.dart';
import 'package:career/features/reset_password/domain/entities/reset_phone_responce.dart';

class RemoteConfirmResetByPhone {
  ApiServer apiServer = ApiServer();
  Future<ResetPassResponce> confirmResetByPhone({required String phone}) async {
    var result = await apiServer.post(
      endPoint: "/api/Authentication/ForgetPassword/$phone",
      data: {},
    );
    return ResetPassResponce.fromJson(result);
  }
}
