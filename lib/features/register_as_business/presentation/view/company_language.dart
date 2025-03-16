import 'package:career/core/app_texts/app_localizations.dart';
import 'package:career/core/const/regs.dart';
import 'package:career/core/widgets/app_contry_code_picker.dart';
import 'package:career/core/widgets/app_drop_down.dart';
import 'package:career/core/widgets/app_text_field.dart';
import 'package:career/core/widgets/forward_widget.dart';
import 'package:career/core/widgets/primary_container.dart';
import 'package:career/core/widgets/title_widget.dart';
import 'package:career/features/register_as_business/presentation/manager/business_cubit.dart';
import 'package:career/features/register_as_business/presentation/manager/business_state.dart';
import 'package:career/features/register_as_business/presentation/page/register_as_business.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BusinessAddressInformation extends StatelessWidget {
  const BusinessAddressInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterAsBusinessCubit, RegisterBusinessState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<RegisterAsBusinessCubit>(context);
        return PrimaryContainer(
          child: Column(
            spacing: 16.h,
            children: [
              TitleWidget(
                title: AppLocalizations.of(context).companyInfo,
                onTap: () => context.read<RegisterAsBusinessCubit>().previous(),
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
