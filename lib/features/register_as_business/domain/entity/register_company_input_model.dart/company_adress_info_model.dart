import 'package:career/features/register_as_business/domain/entity/register_company_input_model.dart/register_company_input_model.dart';

class CompanyAdressInfoModel extends CompanyAddresss {
  CompanyAdressInfoModel(
      {super.governorateId,
      this.governorateName,
      super.areaId,
      this.areaName,
      super.streetAddress,
      super.isDefault});
  String? governorateName;
  String? areaName;
}
