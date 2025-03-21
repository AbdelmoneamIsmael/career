import 'package:career/core/errors/error_class.dart';
import 'package:career/features/register_as_business/data/model/register_company_responce_model.dart';
import 'package:career/features/register_as_business/domain/entity/register_company_input_model.dart/register_company_input_model.dart';
import 'package:dartz/dartz.dart';

abstract class RegisterBusinessRepo {
  Future<Either <Failure, CompanyRegisterResponse>> registerCompany({required CompanyRegisterModel companyRegisterModel});
}