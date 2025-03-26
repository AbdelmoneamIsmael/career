import 'package:career/core/app_texts/app_localizations.dart';
import 'package:career/core/bloc/app_bloc.dart';
import 'package:career/core/const/enums.dart';
import 'package:career/core/const/regs.dart';
import 'package:career/core/global_views/all_nationality/view/all_nationality_view.dart';
import 'package:career/core/model/app_model/app_model.dart';
import 'package:career/core/src/countries.dart';
import 'package:career/core/widgets/app_contry_code_picker.dart';
import 'package:career/core/widgets/app_drop_down.dart';
import 'package:career/core/widgets/app_text_field.dart';
import 'package:career/core/widgets/primary_container.dart';
import 'package:career/features/register_as_person/presentation/cubit/register_as_person_cubit.dart';
import 'package:career/core/widgets/forward_widget.dart';
import 'package:career/core/widgets/title_widget.dart';
import 'package:career/features/register_as_person/presentation/cubit/register_as_person_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoreInformation extends StatelessWidget {
  const CoreInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterAsPersonCubit, RegisterAsPersonState>(
      builder: (context, state) {
        final cubit = context.read<RegisterAsPersonCubit>();
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
                controller: cubit.nameController,
                hint: AppLocalizations.of(context).fullName,
                prefixIcon: const Icon(
                  Icons.person,
                ),
              ),
              AppTextField(
                controller: cubit.userNameController,
                hint: AppLocalizations.of(context).userName,
                prefixIcon: const Icon(
                  Icons.person,
                ),
              ),
              AppTextField(
                controller: cubit.emailController,
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
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context).passwordNotVailid;
                  }
                  if (value.length < 8) {
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
                controller: cubit.jopTitleController,
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
                      items: genderEnum.map((e) {
                        print(e);
                        return DropdownMenuItem(
                          value: e,
                          child: Text(
                            context.read<AppBloc>().appModel.language ==
                                    ApplicationLanguage.en
                                ? e.nameEn ?? ""
                                : e.nameAr ?? "",
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        cubit.registerModel.gender = value.value;
                      },
                      hint: AppLocalizations.of(context).gender,
                    ),
                  ),
                ],
              ),
              AppTextField(
                readOnly: true,
                hint: AppLocalizations.of(context).dateOfBirth,
                controller: cubit.dateController,
                prefixIcon: GestureDetector(
                  onTap: () async {
                    DateTime? date = await showDatePicker(
                      context: context,
                      initialDate: DateTime(2000, 6),
                      firstDate: DateTime(1800, 6),
                      lastDate: DateTime(2016, 1),
                    );
                    if (date != null) {
                      cubit.dateController.text = date.toString();
                    }
                  },
                  child: const Icon(
                    Icons.date_range_outlined,
                  ),
                ),
              ),
              AppTextField(
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
                readOnly: true,
                hint: AppLocalizations.of(context).nationality,
                controller: cubit.nationalityController,
                prefixIcon: const Icon(
                  Icons.flag,
                ),
              ),
              // AppDropdown(
              //   prefixIcon: const Icon(
              //     Icons.flag,
              //   ),
              //   items: [],
              //   onChanged: (value) {},
              //   hint: AppLocalizations.of(context).nationality,
              // ),

              const SizedBox(),
              const SizedBox(),
              ForwardWidget(
                onPressed: () {
                  if (cubit.checkCoreInfoValidate(context)) {
                    context.read<RegisterAsPersonCubit>().next();
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
