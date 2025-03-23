import 'package:career/features/register_as_business/domain/entity/register_company_input_model.dart/register_company_input_model.dart';

class AdressInfoModel extends AddresssModel {
  AdressInfoModel(
      {super.governorateId,
      this.governorateName,
      super.areaId,
      this.areaName,
      super.streetAddress,
      super.isDefault});
  String? governorateName;
  String? areaName;
}
