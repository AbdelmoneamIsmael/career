import 'package:career/core/themes/styles/app_text_style.dart';
import 'package:career/features/register_as_business/domain/entity/register_company_input_model.dart/company_adress_info_model.dart';
import 'package:flutter/material.dart';

class CompanyADressInfoWidget extends StatelessWidget {
  const CompanyADressInfoWidget({
    super.key,
    required this.address,
    required this.onDelete,
    required this.onEdit,
  });
  final AdressInfoModel address;
  final VoidCallback onDelete, onEdit;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.location_on_rounded,
          color: Theme.of(context).textTheme.bodyMedium!.color,
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5,
            children: [
              Text(
                "${address.governorateName!} - ${address.areaName!}",
                style: AppTextStyle.simiBold18(context),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Column(
          children: [
            IconButton(
              onPressed: onDelete,
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            IconButton(
              onPressed: onEdit,
              icon: const Icon(
                Icons.edit,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
