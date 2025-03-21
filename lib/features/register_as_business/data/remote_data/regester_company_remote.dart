import 'package:career/core/utils/api/api_server.dart';
import 'package:career/features/register_as_business/domain/entity/register_company_input_model.dart/register_company_input_model.dart';
import 'package:dio/dio.dart';

class RegesterCompanyRemote {
  ApiServer apiServer = ApiServer();
  Future<Map<String, dynamic>> regesterCompany({
    required CompanyRegisterModel companyRegisterModel,
  }) async {
    var companyJson = await companyRegisterModel.toJson();
    var result = await apiServer.post(
      endPoint: "/api/SignUp/BuisnesSignUp",
      data: FormData.fromMap(companyJson),
    );
    return result;
  }
}
