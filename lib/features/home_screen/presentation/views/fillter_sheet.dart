import 'package:career/core/app_texts/app_localizations.dart';
import 'package:career/core/themes/styles/app_text_style.dart';
import 'package:career/core/widgets/app_drop_down.dart';
import 'package:career/core/widgets/screen_wrapper.dart';
import 'package:career/features/home_screen/presentation/cubit/home_screen_cubit.dart';
import 'package:career/features/home_screen/presentation/cubit/home_screen_state.dart';
import 'package:career/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FillterPage extends StatelessWidget {
  const FillterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenCubit, HomeScreenState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<HomeScreenCubit>(context);
        return ScreenWrapper(
          backgroundImage: DecorationImage(
            image: AssetImage(
              Assets.images.search.path,
            ),
            fit: BoxFit.cover,
          ),
          appBar: AppBar(
            title: Text(AppLocalizations.of(context).fillterPage),
          ),
          body: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              spacing: 20.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context).salary,
                  style: AppTextStyle.medium18(context),
                ),
                Row(
                  spacing: 10,
                  children: [
                    Expanded(
                        child: AppDropdown(
                            items: cubit.sallary
                                .map((value) => DropdownMenuItem(
                                    value: value, child: Text("$value \$")))
                                .toList(),
                            onChanged: (value) {},
                            hint: AppLocalizations.of(context).salaryFrom)),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Theme.of(context).textTheme.bodySmall!.color,
                    ),
                    Expanded(
                        child: AppDropdown(
                            items: cubit.sallary
                                .map((value) => DropdownMenuItem(
                                    value: value, child: Text("$value \$")))
                                .toList(),
                            onChanged: (value) {},
                            hint: AppLocalizations.of(context).salaryFrom)),
                  ],
                ),
                Text(
                  AppLocalizations.of(context).jopkind,
                  style: AppTextStyle.medium18(context),
                ),
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 10.h,
                    childAspectRatio: 7,
                  ),
                  shrinkWrap: true,
                  itemCount: cubit.jobs.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => AppRadioButton(
                    title: cubit.jobs[index],
                    value: cubit.jobs[index],
                    groupValue: cubit.selectedJob,
                    onChanged: (value) {
                      context.read<HomeScreenCubit>().changeJopKind(value);
                    },
                  ),
                ),
                Text(
                  AppLocalizations.of(context).searchFor,
                  style: AppTextStyle.medium18(context),
                ),
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 10.h,
                    childAspectRatio: 7,
                  ),
                  shrinkWrap: true,
                  itemCount: cubit.jobs.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => AppRadioButton(
                    title: cubit.searchFor[index],
                    value: cubit.searchFor[index],
                    groupValue: cubit.selectedSearchFor,
                    onChanged: (value) {
                      context.read<HomeScreenCubit>().changeSearchFor(value);
                    },
                  ),
                ),
                Text(
                  AppLocalizations.of(context).experience,
                  style: AppTextStyle.medium18(context),
                ),
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 10.h,
                    childAspectRatio: 7,
                  ),
                  shrinkWrap: true,
                  itemCount: cubit.experience.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => AppRadioButton(
                    title: cubit.experience[index],
                    value: cubit.experience[index],
                    groupValue: cubit.selectedExperience,
                    onChanged: (value) {
                      context.read<HomeScreenCubit>().changeExperience(value);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class AppRadioButton extends StatelessWidget {
  const AppRadioButton({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    this.onChanged,
  });
  final String title, value, groupValue;
  final ValueChanged<String?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        Text(title),
      ],
    );
  }
}
