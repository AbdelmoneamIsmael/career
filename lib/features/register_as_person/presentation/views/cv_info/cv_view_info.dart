import 'package:career/core/app_texts/app_localizations.dart';
import 'package:career/core/global_views/all_areas/model/all_area_responce.dart';
import 'package:career/core/global_views/all_areas/view/get_all_all_area.dart';
import 'package:career/core/global_views/all_governorates/model/all_governorates_responce.dart';
import 'package:career/core/global_views/all_governorates/view/get_all_all_governorates.dart';
import 'package:career/core/src/language.dart';
import 'package:career/core/themes/styles/app_text_style.dart';
import 'package:career/core/widgets/app_drop_down.dart';
import 'package:career/core/widgets/app_svg.dart';
import 'package:career/core/widgets/app_text_field.dart';
import 'package:career/core/widgets/primary_button.dart';
import 'package:career/core/widgets/primary_container.dart';
import 'package:career/features/register_as_person/presentation/cubit/register_as_person_cubit.dart';
import 'package:career/core/widgets/forward_widget.dart';
import 'package:career/core/widgets/title_widget.dart';
import 'package:career/features/register_as_person/presentation/cubit/register_as_person_state.dart';
import 'package:career/gen/assets.gen.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CvViewInfo extends StatelessWidget {
  const CvViewInfo({super.key});

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
                title: AppLocalizations.of(context).cvInfo,
                onTap: () => context.read<RegisterAsPersonCubit>().previous(),
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
                onChanged: (value) {
                  cubit.cvLanguage.text = value!;
                },
                hint: AppLocalizations.of(context).languageOfCV,
              ),
              const SizedBox(),
              DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(10.r),
                color: Theme.of(context).textTheme.bodySmall!.color!,
                padding: const EdgeInsets.all(20),
                child: context.read<RegisterAsPersonCubit>().cv != null
                    ? Stack(
                        children: [
                          Positioned(
                            top: 0,
                            left: -5,
                            child: SizedBox(
                              height: 40.h,
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: SvgPicture.asset(
                                  Assets.icons.pdf,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(10.r),
                              ),
                              border: Border.all(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .color!,
                              ),
                            ),
                            height: 40.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  context
                                      .read<RegisterAsPersonCubit>()
                                      .cv!
                                      .name,
                                  style:
                                      AppTextStyle.medium14(context).copyWith(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .color,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          const Icon(
                            Icons.picture_as_pdf,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                ".png .pdf .jpg",
                                style: AppTextStyle.medium14(context).copyWith(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .color,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
              ),
              PrimaryButton(
                text: AppLocalizations.of(context).uploadCV,
                onPressed: () {
                  context.read<RegisterAsPersonCubit>().pdfPicker();
                },
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
                controller: cubit.adress,
                hint: AppLocalizations.of(context).address,
                prefixIcon: const Icon(
                  Icons.home,
                ),
              ),
              const SizedBox(),
              AppTextField(
                controller: cubit.facebookController,
                hint: AppLocalizations.of(context).facebookUrl,
                prefixIcon: const Icon(
                  Icons.facebook,
                ),
                keyboardType: TextInputType.url,
              ),
              AppTextField(
                controller: cubit.linkedinController,
                keyboardType: TextInputType.url,
                prefixIcon: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: AppSvg(
                    path: Assets.icons.linkedIn,
                    width: 18.w,
                  ),
                ),
                hint: AppLocalizations.of(context).linkedinUrl,
              ),
              AppTextField(
                controller: cubit.websiteController,
                keyboardType: TextInputType.url,
                prefixIcon: const Icon(
                  Icons.language,
                ),
                hint: AppLocalizations.of(context).websiteUrl,
              ),
              const SizedBox(),
              const SizedBox(),
              ForwardWidget(
                onPressed: () {
                  if (cubit.checkCVInfo(context)) {
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
