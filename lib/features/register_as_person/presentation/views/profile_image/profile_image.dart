import 'package:career/core/app_texts/app_localizations.dart';
import 'package:career/core/themes/styles/app_text_style.dart';
import 'package:career/core/widgets/primary_container.dart';
import 'package:career/features/register_as_person/presentation/cubit/register_as_person_cubit.dart';
import 'package:career/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16.h,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  context.read<RegisterAsPersonCubit>().previous();
                },
                icon: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Theme.of(context).textTheme.bodyMedium!.color,
                ),
              ),
              Text(
                AppLocalizations.of(context).profileImage,
                style: AppTextStyle.simiBold20(context),
              ),
            ],
          ),
          const SizedBox(),
          const SizedBox(),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(200.r),
              child: Image.asset(
                Assets.images.profile.path,
                width: 200.w,
                height: 200.w,
                fit: BoxFit.cover,
                alignment: const Alignment(
                  .5,
                  0,
                ),
              ),
            ),
          ),
          const SizedBox(),
          const SizedBox(),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              shape: const CircleBorder(),
              onPressed: () {
                context.read<RegisterAsPersonCubit>().next();
              },
              backgroundColor: Theme.of(context).textTheme.bodyMedium!.color,
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
