import 'package:career/core/app_texts/app_localizations.dart';
import 'package:career/core/global_views/all_areas/model/all_area_responce.dart';
import 'package:career/core/global_views/all_areas/view/get_all_all_area.dart';
import 'package:career/core/global_views/all_governorates/model/all_governorates_responce.dart';
import 'package:career/core/global_views/all_governorates/view/get_all_all_governorates.dart';
import 'package:career/core/widgets/app_text_field.dart';
import 'package:career/core/widgets/forward_widget.dart';
import 'package:career/core/widgets/primary_button.dart';
import 'package:career/core/widgets/primary_container.dart';
import 'package:career/core/widgets/title_widget.dart';
import 'package:career/core/widgets/ui_function.dart';
import 'package:career/features/register_as_business/presentation/manager/business_cubit.dart';
import 'package:career/features/register_as_business/presentation/manager/business_state.dart';
import 'package:career/features/register_as_business/presentation/widget/company_address_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motion_toast/resources/arrays.dart';

class BusinessAddressInformation extends StatelessWidget {
  const BusinessAddressInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterAsBusinessCubit, RegisterBusinessState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<RegisterAsBusinessCubit>(context);
        return Column(
          spacing: 20.h,
          children: [
            PrimaryContainer(
              child: Column(
                spacing: 16.h,
                children: [
                  TitleWidget(
                    title: AppLocalizations.of(context).companyInfo,
                    onTap: () =>
                        context.read<RegisterAsBusinessCubit>().previous(),
                  ),
                  const SizedBox(),
                  Row(
                    children: [
                      Expanded(
                        child: AppTextField(
                          controller: cubit.governorateController,
                          ontap: () async {
                            Governerates? result = await showSearch(
                              context: context,
                              delegate: AllGovernoratesSearchView(),
                            ) as Governerates?;
                            cubit.assignGovernorate(result);
                          },
                          readOnly: true,
                          hint: AppLocalizations.of(context).governorate,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: AppTextField(
                          controller: cubit.areaController,
                          readOnly: true,
                          ontap: cubit.selectedGovernorate == null
                              ? () {}
                              : () async {
                                  Areas? result = await showSearch(
                                    context: context,
                                    delegate: AllAreasSearchView(
                                      cubit.selectedGovernorate!.id!,
                                    ),
                                  ) as Areas?;

                                  cubit.assignArea(
                                    result,
                                  );
                                },
                          hint: AppLocalizations.of(context).area,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  AppTextField(
                    hint: AppLocalizations.of(context).address,
                    controller: cubit.adressController,
                    prefixIcon: const Icon(Icons.home_outlined),
                  ),
                  const SizedBox(),
                  PrimaryButton(
                    text: AppLocalizations.of(context).add,
                    onPressed: cubit.addAddress,
                  ),
                ],
              ),
            ),
            cubit.addresses.isNotEmpty
                ? PrimaryContainer(
                    child: Column(
                      spacing: 16.h,
                      children: [
                        ...List.generate(
                          cubit.addresses.length,
                          (index) {
                            return CompanyADressInfoWidget(
                              onDelete: () =>
                                  cubit.deleteAddress(cubit.addresses[index]),
                              onEdit: () =>
                                  cubit.editAddress(cubit.addresses[index]),
                              address: cubit.addresses[index],
                            );
                          },
                        ),
                        const SizedBox(),
                        const SizedBox(),
                        ForwardWidget(
                          onPressed: () {
                            cubit.assignAddress();
                            if (cubit.finalReview()) {
                              cubit.confirmRegister();
                            } else {
                              UiHelper.showSnakBar(
                                context: context,
                                message: AppLocalizations.of(context)
                                    .youShouldFillAllFields,
                                type: MotionToastType.info,
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  )
                : const SizedBox(),
          ],
        );
      },
    );
  }
}
