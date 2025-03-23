import 'package:career/core/utils/api/api_server.dart';
import 'package:career/features/otp_screen/data/models/otp_responce_model.dart';
import 'package:career/features/otp_screen/domain/entities/conform_parameters.dart';

class ConfirmOtpRemote {
  final ApiServer apiServer = ApiServer();

  Future<OtpResponseModel> confirmOtp({
    required ConfirmOtpParameters optPrameters,
  }) async {
    var result = await apiServer.post(
      endPoint: "/api/Authentication/ConfirmPhone",
      data: optPrameters.toJson(),
    );
    OtpResponseModel otpResponseModel = OtpResponseModel.fromJson(result);
    return otpResponseModel;
  }
}

class ResendOtpRemote {
  final ApiServer apiServer = ApiServer();

  Future<String> resendOtp({required String phone}) async {
    var result = await apiServer.post(
      endPoint: "/api/Authentication/ResendOTP/$phone",
      data: {},
    );
    
    return result["message"] ;
  }
}
