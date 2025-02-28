import 'package:career/core/app_texts/app_localizations.dart';
import 'package:career/core/src/language.dart';
import 'package:career/core/widgets/app_drop_down.dart';
import 'package:career/core/widgets/app_text_field.dart';
import 'package:career/core/widgets/forward_widget.dart';
import 'package:career/core/widgets/primary_container.dart';
import 'package:career/core/widgets/title_widget.dart';
import 'package:career/features/register_as_business/presentation/manager/business_cubit.dart';
import 'package:career/features/register_as_business/presentation/manager/business_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ComPanyInfo extends StatelessWidget {
  const ComPanyInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterAsBusinessCubit, RegisterBusinessState>(
      builder: (context, state) {
        return PrimaryContainer(
          child: Column(
            spacing: 16.h,
            children: [
              TitleWidget(
                title: AppLocalizations.of(context).cvInfo,
                onTap: () => context.read<RegisterAsBusinessCubit>().previous(),
              ),
              const SizedBox(),
              AppDropdown(
                value: popularLanguages[0],
                prefixIcon: const Icon(
                  Icons.language,
                ),
                items: popularLanguages
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                onChanged: (value) {},
                hint: AppLocalizations.of(context).languageOfCV,
              ),
              const SizedBox(),
              Row(
                children: [
                  Expanded(
                    child: AppDropdown(
                      items: [],
                      onChanged: (value) {},
                      hint: AppLocalizations.of(context).state,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: AppDropdown(
                      items: [],
                      onChanged: (value) {},
                      hint: AppLocalizations.of(context).city,
                    ),
                  ),
                ],
              ),
              AppTextField(
                hint: AppLocalizations.of(context).address,
                prefixIcon: const Icon(Icons.home_outlined),
              ),
              const SizedBox(),
              const SizedBox(),
             ForwardWidget(
                onPressed: () => context.read<RegisterAsBusinessCubit>().next(),
              ),
            ],
          ),
        );
      },
    );
  }
}
