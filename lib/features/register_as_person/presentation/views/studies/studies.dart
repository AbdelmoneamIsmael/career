import 'package:career/core/app_texts/app_localizations.dart';
import 'package:career/core/themes/styles/app_text_style.dart';
import 'package:career/core/widgets/app_text_field.dart';
import 'package:career/core/widgets/primary_button.dart';
import 'package:career/core/widgets/primary_container.dart';
import 'package:career/features/register_as_person/presentation/cubit/register_as_person_cubit.dart';
import 'package:career/core/widgets/forward_widget.dart';
import 'package:career/core/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Studies extends StatelessWidget {
  const Studies({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PrimaryContainer(
          child: Column(
            spacing: 16.h,
            children: [
              TitleWidget(
                title: AppLocalizations.of(context).studies,
                onTap: () => context.read<RegisterAsPersonCubit>().previous(),
              ),
              const SizedBox(),
              AppTextField(
                hint: AppLocalizations.of(context).university,
                prefixIcon: const Icon(Icons.account_balance_sharp),
              ),
              AppTextField(
                hint: AppLocalizations.of(context).degree,
                prefixIcon: const Icon(
                  Icons.school,
                ),
              ),
              AppTextField(
                hint: AppLocalizations.of(context).department,
                prefixIcon: const Icon(
                  Icons.work,
                ),
              ),
              AppTextField(
                hint: AppLocalizations.of(context).year,
                prefixIcon: const Icon(
                  Icons.calendar_month,
                ),
              ),
              const SizedBox(),
              const SizedBox(),
              Align(
                alignment: Alignment.bottomRight,
                child: PrimaryButton(
                  text: AppLocalizations.of(context).add,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
        PrimaryContainer(
            child: Column(
          spacing: 16.h,
          children: [
            const StudyWidget(),
            const StudyWidget(),
            const StudyWidget(),
            const StudyWidget(),
            const SizedBox(),
            const SizedBox(),
              ForwardWidget(
              onPressed: () => context.read<RegisterAsPersonCubit>().next(),
            ),
          ],
        ))
      ],
    );
  }
}

class StudyWidget extends StatelessWidget {
  const StudyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const Icon(
        Icons.account_balance_sharp,
      ),
      title: const Text("university"),
      subtitle: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("department"),
          Text("year"),
        ],
      ),
      titleTextStyle: AppTextStyle.medium14(context),
      trailing: const Column(
        children: [
          Icon(
            Icons.delete,
          ),
          SizedBox(
            height: 5,
          ),
          Icon(
            Icons.edit,
          ),
        ],
      ),
    );
  }
}
