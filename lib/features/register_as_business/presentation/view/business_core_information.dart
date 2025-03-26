import 'package:career/core/app_texts/app_localizations.dart';
import 'package:career/core/const/regs.dart';
import 'package:career/core/global_views/all_nationality/view/all_nationality_view.dart';
import 'package:career/core/src/countries.dart';
import 'package:career/core/widgets/app_contry_code_picker.dart';
import 'package:career/core/widgets/app_text_field.dart';
import 'package:career/core/widgets/forward_widget.dart';
import 'package:career/core/widgets/primary_container.dart';
import 'package:career/core/widgets/title_widget.dart';
import 'package:career/core/widgets/ui_function.dart';
import 'package:career/features/register_as_business/presentation/manager/business_cubit.dart';
import 'package:career/features/register_as_business/presentation/manager/business_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motion_toast/resources/arrays.dart';

class BusinessCoreInformation extends StatelessWidget {
  const BusinessCoreInformation({super.key});

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
              AppTextField(
                controller: cubit.nameController,
                hint: AppLocalizations.of(context).companyName,
                prefixIcon: const Icon(
                  Icons.home_work_outlined,
                ),
              ),
              AppTextField(
                controller: cubit.companySizedController,
                hint: AppLocalizations.of(context).companySized,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                prefixIcon: const Icon(
                  Icons.numbers,
                ),
              ),
              AppTextField(
                controller: cubit.userNameController,
                hint: AppLocalizations.of(context).userName,
                prefixIcon: const Icon(
                  Icons.home_work_outlined,
                ),
              ),
              AppTextField(
                controller: cubit.emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !RegExp(emailRegex).hasMatch(value)) {
                    return AppLocalizations.of(context).emailNotValid;
                  }

                  return null;
                },
                hint: AppLocalizations.of(context).email,
                prefixIcon: const Icon(
                  Icons.email,
                ),
              ),
              AppTextField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context).phoneNotValid;
                  } else if (value.length < 8) {
                    return AppLocalizations.of(context).phoneNotValid;
                  }
                  return null;
                },
                controller: cubit.phoneController,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                hint: AppLocalizations.of(context).phone,
                prefixIcon: CountryCodePrefixIcon(
                  onChanged: (code) {
                    cubit.code = code.dialCode!;
                  },
                ),
              ),
              AppTextField(
                controller: cubit.passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length <= 6) {
                    return AppLocalizations.of(context).passwordNotVailid;
                  }
                  return null;
                },
                hint: AppLocalizations.of(context).password,
                prefixIcon: const Icon(
                  Icons.lock,
                ),
                scure: true,
              ),
              AppTextField(
                controller: cubit.nationalityController,
                prefixIcon: const Icon(
                  Icons.flag,
                ),
                ontap: () async {
                  CountryModel? selectedCountry = await showSearch(
                    context: context,
                    delegate: MySearchDelegate(
                      cubit.nationalityController,
                    ),
                  ) as CountryModel?;
                  if (selectedCountry != null) {
                    cubit.registerModel.nationalityId = selectedCountry.id;
                  }
                },
                hint: AppLocalizations.of(context).nationality,
              ),
              const SizedBox(),
              ForwardWidget(
                onPressed: () {
                  if (cubit.coreInformationValid()) {
                    context.read<RegisterAsBusinessCubit>().next();
                  } else {
                    UiHelper.showSnakBar(
                      context: context,
                      message:
                          AppLocalizations.of(context).youShouldFillAllFields,
                      type: MotionToastType.info,
                    );
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
