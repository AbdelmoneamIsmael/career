import 'package:career/core/app_texts/app_localizations.dart';
import 'package:career/core/themes/styles/app_text_style.dart';
import 'package:career/core/widgets/app_text_field.dart';
import 'package:career/core/widgets/primary_button.dart';
import 'package:career/core/widgets/primary_container.dart';
import 'package:career/core/widgets/ui_function.dart';
import 'package:career/features/register_as_person/presentation/cubit/register_as_person_cubit.dart';
import 'package:career/core/widgets/forward_widget.dart';
import 'package:career/core/widgets/title_widget.dart';
import 'package:career/features/register_as_person/presentation/cubit/register_as_person_state.dart';
import 'package:career/features/register_as_person/presentation/widgets/study_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motion_toast/resources/arrays.dart';

class Studies extends StatelessWidget {
  const Studies({super.key});

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
                    title: AppLocalizations.of(context).studies,
                    onTap: () =>
                        context.read<RegisterAsPersonCubit>().previous(),
                  ),
                  const SizedBox(),
                  AppTextField(
                    controller: cubit.university,
                    hint: AppLocalizations.of(context).university,
                    prefixIcon: const Icon(Icons.account_balance_sharp),
                  ),
                  AppTextField(
                    controller: cubit.degree,
                    hint: AppLocalizations.of(context).degree,
                    prefixIcon: const Icon(
                      Icons.school,
                    ),
                  ),
                  AppTextField(
                    controller: cubit.department,
                    hint: AppLocalizations.of(context).department,
                    prefixIcon: const Icon(
                      Icons.work,
                    ),
                  ),
                  AppTextField(
                    controller: cubit.year,
                    hint: AppLocalizations.of(context).year,
                    readOnly: true,
                    prefixIcon: GestureDetector(
                      onTap: () async {
                        DateTime? date = await UiHelper.showDatePicker(
                          context: context,
                          initialDate: DateTime(2022),
                          firstDate: DateTime(2000),
                          lastDate: DateTime.now(),
                        );

                        if (date != null) {
                          cubit.year.text = date.toString();
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
                        cubit.checkStudiesInfo(context);
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
                ...List.generate(
                  cubit.registerModel.studies.length,
                  (index) {
                    return StudyWidget(
                      onDelete: () => cubit.deleteStudy(index),
                      onEdit: () => cubit.editStudy(index),
                      study: cubit.registerModel.studies[index],
                    );
                  },
                ),
                const SizedBox(),
                const SizedBox(),
                ForwardWidget(
                  onPressed: () {
                    if (cubit.registerModel.studies.isNotEmpty) {
                      context.read<RegisterAsPersonCubit>().next();
                    } else {
                      UiHelper.showSnakBar(
                        message:
                            AppLocalizations.of(context).youShouldFillAllFields,
                        context: context,
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
