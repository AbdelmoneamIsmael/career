import 'package:career/core/utils/api/api_server.dart';
import 'package:career/features/reset_password/domain/entities/reset_phone_responce.dart';

class RemoteResetePassword {
  ApiServer apiServer = ApiServer();
  Future<ResetPassResponce> resetPassword(
      {required String phone,
      required String newPassword,
      required String otp}) async {
    var result = await apiServer.post(
      endPoint: "/api/Authentication/ChangePassword/$phone",
      data: {"phoneNumber": phone, "otp": otp, "newPassword": newPassword},
    );
    return ResetPassResponce.fromJson(result);
  }
}
