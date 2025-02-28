import 'package:career/core/app_texts/app_localizations.dart';
import 'package:career/core/widgets/app_contry_code_picker.dart';
import 'package:career/core/widgets/app_drop_down.dart';
import 'package:career/core/widgets/app_text_field.dart';
import 'package:career/core/widgets/forward_widget.dart';
import 'package:career/core/widgets/primary_container.dart';
import 'package:career/core/widgets/title_widget.dart';
import 'package:career/features/register_as_business/presentation/manager/business_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BusinessCoreInformation extends StatelessWidget {
  const BusinessCoreInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      child: Column(
        spacing: 16.h,
        children: [
          TitleWidget(
            title: AppLocalizations.of(context).companyInfo,
            onTap: () => context.read<RegisterAsBusinessCubit>().previous(),
          ),
          const SizedBox(),
          AppTextField(
            hint: AppLocalizations.of(context).companyName,
            prefixIcon: const Icon(
              Icons.home_work_outlined,
            ),
          ),
          AppTextField(
            hint: AppLocalizations.of(context).email,
            prefixIcon: const Icon(
              Icons.email,
            ),
          ),
          AppTextField(
            hint: AppLocalizations.of(context).phone,
            prefixIcon: const CountryCodePrefixIcon(),
          ),
          AppTextField(
            hint: AppLocalizations.of(context).password,
            prefixIcon: const Icon(
              Icons.lock,
            ),
            scure: true,
          ),
          AppTextField(
            hint: AppLocalizations.of(context).dateOfCreate,
            prefixIcon: const Icon(
              Icons.date_range_outlined,
            ),
          ),
          AppDropdown(
            prefixIcon: const Icon(
              Icons.flag,
            ),
            items: [],
            onChanged: (value) {},
            hint: AppLocalizations.of(context).nationality,
          ),
          const SizedBox(),
          ForwardWidget(
            onPressed: () => context.read<RegisterAsBusinessCubit>().next(),
          ),
        ],
      ),
    );
  }
}
