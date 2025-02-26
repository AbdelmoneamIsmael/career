import 'package:career/core/app_texts/app_localizations.dart';
import 'package:career/core/themes/styles/app_text_style.dart';
import 'package:career/core/widgets/app_drop_down.dart';
import 'package:career/core/widgets/app_text_field.dart';
import 'package:career/core/widgets/primary_button.dart';
import 'package:career/core/widgets/primary_container.dart';
import 'package:career/core/widgets/screen_wrapper.dart';
import 'package:career/features/create_post/presentation/cubit/create_post_cubit.dart';
import 'package:career/features/create_post/presentation/cubit/create_post_state.dart';
import 'package:career/features/home_screen/presentation/views/fillter_sheet.dart';
import 'package:career/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreatePostCubit, CreatePostState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<CreatePostCubit>(context);
        cubit.onInit();
        return ScreenWrapper(
          bottomNavigationBar: PrimaryContainer(
            margin: const EdgeInsets.all(0),
            padding: const EdgeInsets.all(28).w,
            child: PrimaryButton(
                text: AppLocalizations.of(context).post, onPressed: () {}),
          ),
          backgroundImage: DecorationImage(
            image: AssetImage(
              Assets.images.createPost.path,
            ),
            fit: BoxFit.cover,
          ),
          appBar: AppBar(
            title: Text(AppLocalizations.of(context).createJopPost),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 12,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: AppTextField(
                        hint: AppLocalizations.of(context).postTitle)),
                AppTextField(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).textTheme.bodySmall!.color!,
                      width: .8,
                    ),
                  ),
                  hint: AppLocalizations.of(context).postDescription,
                  maxLines: 12,
                ),
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
                      context.read<CreatePostCubit>().changeJopKind(value);
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
                      context.read<CreatePostCubit>().changeExperience(value);
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
