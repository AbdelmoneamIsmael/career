import 'package:career/core/themes/styles/app_text_style.dart';
import 'package:career/features/register_as_person/domain/entities/register_input_model.dart';
import 'package:flutter/material.dart';

class StudyWidget extends StatelessWidget {
  const StudyWidget({
    super.key,
    required this.study,
    required this.onDelete,
    required this.onEdit,
  });
  final Study study;
  final VoidCallback onDelete, onEdit;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.account_balance_sharp,
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
                study.univirsity!,
                style: AppTextStyle.simiBold18(context),
              ),
              Text(
                study.department!,
                style: AppTextStyle.medium16(context),
              ),
              Row(
                children: [
                  Text(
                    study.year!.year.toString(),
                    style: AppTextStyle.regular14(context),
                  ),
                  Text(
                    " (${study.degree!})",
                    style: AppTextStyle.regular12(context),
                  ),
                ],
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
