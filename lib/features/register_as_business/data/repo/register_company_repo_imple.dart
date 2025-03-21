import 'package:career/core/errors/error_class.dart';
import 'package:career/features/register_as_business/data/model/register_company_responce_model.dart';
import 'package:career/features/register_as_business/data/remote_data/regester_company_remote.dart';
import 'package:career/features/register_as_business/domain/entity/register_company_input_model.dart/register_company_input_model.dart';
import 'package:career/features/register_as_business/domain/repo/reister_business_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class RegisterCompanyRepoImple extends RegisterBusinessRepo {
  RegisterCompanyRepoImple({required this.regesterCompanyRemote});

  final RegesterCompanyRemote regesterCompanyRemote;
  @override
  Future<Either<Failure, CompanyRegisterResponse>> registerCompany(
      {required CompanyRegisterModel companyRegisterModel}) async {
    try {
      var result =await  regesterCompanyRemote.regesterCompany(
        companyRegisterModel: companyRegisterModel,
      );
      CompanyRegisterResponse companyRegisterResponse =
          CompanyRegisterResponse.fromJson(result);
      return Right(companyRegisterResponse);

    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
