import 'package:career/core/app_texts/app_localizations.dart';
import 'package:career/core/themes/colors/colors.dart';
import 'package:career/core/themes/styles/app_text_style.dart';
import 'package:career/core/widgets/app_text_field.dart';
import 'package:career/core/widgets/forward_widget.dart';
import 'package:career/core/widgets/primary_button.dart';
import 'package:career/core/widgets/primary_container.dart';
import 'package:career/core/widgets/title_widget.dart';
import 'package:career/core/widgets/ui_function.dart';
import 'package:career/features/register_as_person/presentation/cubit/register_as_person_cubit.dart';
import 'package:career/features/register_as_person/presentation/cubit/register_as_person_state.dart';
import 'package:career/features/register_as_person/presentation/widgets/cirtification_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motion_toast/resources/arrays.dart';

class Cirtifications extends StatelessWidget {
  const Cirtifications({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterAsPersonCubit, RegisterAsPersonState>(
      builder: (context, state) {
        final cubit = context.read<RegisterAsPersonCubit>();
        return Column(
          children: [
            PrimaryContainer(
              child: Column(
                spacing: 16.h,
                children: [
                  TitleWidget(
                    title: AppLocalizations.of(context).certifications,
                    onTap: () =>
                        context.read<RegisterAsPersonCubit>().previous(),
                  ),
                  const SizedBox(),
                  AppTextField(
                    controller: cubit.cirtificationTitle,
                    hint: AppLocalizations.of(context).certificationName,
                    prefixIcon: const Icon(Icons.account_box),
                  ),
                  AppTextField(
                    controller: cubit.cirtificationGivenBy,
                    hint: AppLocalizations.of(context).givenBy,
                    prefixIcon: const Icon(Icons.account_box),
                  ),
                  AppTextField(
                    controller: cubit.cirtificationdescription,
                    hint: AppLocalizations.of(context).description,
                    prefixIcon: const Icon(
                      Icons.description,
                    ),
                  ),
                  AppTextField(
                    controller: cubit.cirtificationGivenDate,
                    readOnly: true,
                    hint: AppLocalizations.of(context).givenDate,
                    prefixIcon: GestureDetector(
                      onTap: () async {
                        var date = await UiHelper.showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (date != null) {
                          cubit.cirtificationGivenDate.text = date.toString();
                        }
                      },
                      child: const Icon(
                        Icons.calendar_month,
                      ),
                    ),
                  ),
                  const SizedBox(),
                  const SizedBox(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: PrimaryButton(
                      text: AppLocalizations.of(context).add,
                      onPressed: () {
                        cubit.validateCirtificationsInfo(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
            PrimaryContainer(
                child: Column(
              spacing: 16.h,
              children: [
                ...List.generate(cubit.registerModel.certifications.length,
                    (index) {
                  return Column(
                    children: [
                      CirtificationsWidget(
                        certification:
                            cubit.registerModel.certifications[index],
                      ),
                      Row(
                        children: [
                          Text(
                            AppLocalizations.of(context).delete,
                            style: AppTextStyle.regular14(context).copyWith(
                              color: LightColors.redColor,
                            ),
                          ),
                        ],
                      )
                    ],
                  );
                }),
                const SizedBox(),
                const SizedBox(),
                ForwardWidget(
                  onPressed: () {
                    if (cubit.registerModel.certifications.isNotEmpty) {
                      context.read<RegisterAsPersonCubit>().next();
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
            ))
          ],
        );
      },
    );
  }
}
