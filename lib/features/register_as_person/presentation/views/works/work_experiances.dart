import 'package:career/core/app_texts/app_localizations.dart';
import 'package:career/core/themes/colors/colors.dart';
import 'package:career/core/themes/styles/app_text_style.dart';
import 'package:career/core/widgets/app_text_field.dart';
import 'package:career/core/widgets/forward_widget.dart';
import 'package:career/core/widgets/primary_button.dart';
import 'package:career/core/widgets/primary_container.dart';
import 'package:career/core/widgets/ui_function.dart';
import 'package:career/features/profile_screen/presentation/pages/profile_screen.dart';
import 'package:career/features/register_as_person/presentation/cubit/register_as_person_cubit.dart';
import 'package:career/features/register_as_person/presentation/cubit/register_as_person_state.dart';
import 'package:career/core/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motion_toast/resources/arrays.dart';

class WorkExperiances extends StatelessWidget {
  const WorkExperiances({super.key});

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
                    title: AppLocalizations.of(context).workExperiances,
                    onTap: () =>
                        context.read<RegisterAsPersonCubit>().previous(),
                  ),
                  const SizedBox(),
                  AppTextField(
                    controller: cubit.companyName,
                    hint: AppLocalizations.of(context).companyName,
                    prefixIcon: const Icon(Icons.account_balance_sharp),
                  ),
                  AppTextField(
                    controller: cubit.jobTitle,
                    hint: AppLocalizations.of(context).jopTitle,
                    prefixIcon: const Icon(Icons.account_box),
                  ),
                  AppTextField(
                    controller: cubit.jopDescription,
                    hint: AppLocalizations.of(context).description,
                    prefixIcon: const Icon(
                      Icons.description,
                    ),
                  ),
                  AppTextField(
                    controller: cubit.location,
                    hint: AppLocalizations.of(context).location,
                    prefixIcon: const Icon(
                      Icons.location_city,
                    ),
                  ),
                  AppTextField(
                    controller: cubit.beginDate,
                    readOnly: true,
                    hint: AppLocalizations.of(context).startDate,
                    prefixIcon: GestureDetector(
                      onTap: () async {
                        var date = await UiHelper.showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (date != null) {
                          cubit.beginDate.text = date.toString();
                        }
                      },
                      child: const Icon(
                        Icons.calendar_month,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: AppTextField(
                          controller: cubit.endDate,
                          readOnly: true,
                          enabeld: !cubit.workHereNow,
                          hint: AppLocalizations.of(context).endDate,
                          prefixIcon: GestureDetector(
                            onTap: () async {
                              var date = await UiHelper.showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime.now(),
                              );
                              if (date != null) {
                                cubit.endDate.text = date.toString();
                              }
                            },
                            child: const Icon(
                              Icons.calendar_month,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: cubit.workHereNow,
                            onChanged: (value) =>
                                cubit.changeWorkHereNow(value, context),
                          ),
                          Text(
                            AppLocalizations.of(context).workingNow,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(),
                  const SizedBox(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: PrimaryButton(
                      text: AppLocalizations.of(context).add,
                      onPressed: () {
                        cubit.validateWorkExperiance(context);
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
                ...List.generate(cubit.registerModel.experiences.length, (index) {
                  return Column(
                    children: [
                      WorkWidget(
                        work: cubit.registerModel.experiences[index],
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => cubit.deleteWork(index),
                            child: Text(
                              AppLocalizations.of(context).delete,
                              style: AppTextStyle.regular14(context).copyWith(
                                color: LightColors.redColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: () => cubit.editWork(index),
                            child: Text(
                              AppLocalizations.of(context).edit,
                              style: AppTextStyle.regular14(context).copyWith(
                                color: LightColors.blueColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  );
                }),
                const SizedBox(),
                const SizedBox(),
                ForwardWidget(
                  onPressed: () {
                    if (cubit.registerModel.experiences.isNotEmpty) {
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
