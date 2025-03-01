import 'package:career/core/app_texts/app_localizations.dart';
import 'package:career/core/const/enums.dart';
import 'package:career/core/widgets/app_contry_code_picker.dart';
import 'package:career/core/widgets/app_drop_down.dart';
import 'package:career/core/widgets/app_text_field.dart';
import 'package:career/core/widgets/primary_container.dart';
import 'package:career/features/register_as_person/presentation/cubit/register_as_person_cubit.dart';
import 'package:career/core/widgets/forward_widget.dart';
import 'package:career/core/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoreInformation extends StatelessWidget {
  const CoreInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      child: Column(
        spacing: 16.h,
        children: [
          TitleWidget(
            title: AppLocalizations.of(context).coreInfo,
            onTap: () => context.read<RegisterAsPersonCubit>().previous(),
          ),
          const SizedBox(),
          AppTextField(
            hint: AppLocalizations.of(context).fullName,
            prefixIcon: const Icon(
              Icons.person,
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
            hint: AppLocalizations.of(context).jopTitle,
            prefixIcon: const Icon(
              Icons.work_outline,
            ),
          ),
          Row(
            spacing: 8.w,
            children: [
              Expanded(
                child: AppDropdown(
                  prefixIcon: const Icon(
                    Icons.male_outlined,
                  ),
                  items: Gender.values.map((e) {
                    print(e);
                    return DropdownMenuItem(
                      value: e,
                      child: Text(e.name),
                    );
                  }).toList(),
                  onChanged: print,
                  hint: AppLocalizations.of(context).gender,
                ),
              ),
            ],
          ),
          AppTextField(
            hint: AppLocalizations.of(context).dateOfBirth,
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
          const SizedBox(),
         ForwardWidget(
            onPressed: ()=>context.read<RegisterAsPersonCubit>().next(),
          ),
        ],
      ),
    );
  }
}
