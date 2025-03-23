import 'package:career/core/utils/api/api_server.dart';
import 'package:career/features/register_as_person/domain/entities/register_input_model.dart';
import 'package:career/features/register_as_person/domain/entities/register_person_responce.dart';
import 'package:dio/dio.dart';

class RemotePersoneRegister {
  final ApiServer apiServer = ApiServer();

  Future<RegisterPersonResponce> regesterPerson({
    required RegisterPersonModel registerInputModel,
  }) async {
    var fromJson = await registerInputModel.toJson();
    var responce = await apiServer.post(
      endPoint: "/api/SignUp/PersonSignUp",
      data: FormData.fromMap(fromJson),
    );
    RegisterPersonResponce registerPersonResponce =
        RegisterPersonResponce.fromJson(responce);
    return registerPersonResponce;
  }
}
