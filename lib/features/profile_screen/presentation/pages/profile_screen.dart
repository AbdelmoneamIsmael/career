import 'package:career/core/app_texts/app_localizations.dart';
import 'package:career/core/app_texts/text_extentions.dart';
import 'package:career/core/themes/styles/app_text_style.dart';
import 'package:career/core/widgets/screen_wrapper.dart';
import 'package:career/features/profile_screen/presentation/cubit/profile_screen_cubit.dart';
import 'package:career/features/profile_screen/presentation/cubit/profile_screen_state.dart';
import 'package:career/features/register_as_person/domain/entities/register_input_model.dart';
import 'package:career/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, });


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileScreenCubit, ProfileScreenState>(
      builder: (context, state) {
        final cubit = context.read<ProfileScreenCubit>();
        return ScreenWrapper(
          backgroundImage: DecorationImage(
            image: AssetImage(
              Assets.images.profile.path,
            ),
            fit: BoxFit.cover,
          ),
          body: CustomScrollView(
            slivers: [
              const SliverAppBar(
                title: Text("Abdelmoneam Ismael"),
                pinned: false,
                floating: true,
                scrolledUnderElevation: 0,
                toolbarHeight: 70,
              ),
              SliverPadding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20).w,
                sliver: SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(40.r),
                        child: Image.asset(
                          Assets.images.profile.path,
                          height: 80.w,
                          width: 80.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Abdelmoneam Ismael",
                              style: AppTextStyle.bold16(context)),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text("Graphic Designer",
                              style: AppTextStyle.medium14(context).copyWith(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .color,
                              )),
                          Text("Iraq - Baghdad 14Ramadan St",
                              style: AppTextStyle.medium14(context).copyWith(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .color,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(16).w,
                sliver: SliverToBoxAdapter(
                  child: Column(
                    spacing: 10.h,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context).aboutMe,
                        style: AppTextStyle.bold18(context),
                      ),
                      const SizedBox(),
                      Padding(
                        padding: const EdgeInsets.only(left: 10).w,
                        child: Column(
                          spacing: 10.h,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Graphic designers often gain experience through internships, which they may undertake while enrolled in a design program. Internships allow aspiring graphic designers to work with designers and to experience the design process from concept to completion",
                              style: AppTextStyle.regular12(context),
                            ),
                            const SizedBox(),
                            ProfileSelectableInfo(
                              value: "almahd.technology@gmail.com",
                              icon: Icon(
                                Icons.email_outlined,
                                size: 16.sp,
                              ),
                            ),
                            ProfileSelectableInfo(
                              value: "+201021016072",
                              icon: Icon(
                                Icons.phone,
                                size: 16.sp,
                              ),
                            ),
                            ProfileSelectableInfo(
                              value: "Iraq Baghdad 14Ramadan St",
                              icon: Icon(
                                Icons.location_on_outlined,
                                size: 16.sp,
                              ),
                            ),
                            ProfileSelectableInfo(
                              value: "3 years experience",
                              icon: Icon(
                                Icons.work_outline,
                                size: 16.sp,
                              ),
                            ),
                            ProfileSelectableInfo(
                              value: "15-2-1990",
                              icon: Icon(
                                Icons.child_friendly_outlined,
                                size: 16.sp,
                              ),
                            ),
                            const SizedBox(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    spacing: 10.h,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context).cvInfo,
                        style: AppTextStyle.bold18(context),
                      ),
                      const SizedBox(),
                      Padding(
                        padding: const EdgeInsets.only(left: 10).w,
                        child: Column(
                          spacing: 10.h,
                          children: [
                            const ProfileSelectableInfo(
                              value: "CvLanguage : Arabic",
                              icon: Icon(
                                Icons.language,
                                size: 16,
                              ),
                            ),
                            ProfileSelectableInfo(
                              value: "Abdelmoenam.pdf",
                              icon: SvgPicture.asset(
                                Assets.icons.cvIcon,
                                colorFilter: ColorFilter.mode(
                                  Theme.of(context).iconTheme.color!,
                                  BlendMode.srcIn,
                                ),
                                width: 16.w,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    spacing: 10.h,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context).workExperiances,
                        style: AppTextStyle.bold18(context),
                      ),
                      const SizedBox(),
                      ...List.generate(
                        3,
                        (index) => Padding(
                          padding: const EdgeInsets.only(left: 10).w,
                          child: const WorkWidget(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    spacing: 10.h,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context).studies,
                        style: AppTextStyle.bold18(context),
                      ),
                      const SizedBox(),
                      ...List.generate(
                        3,
                        (index) => Padding(
                          padding: const EdgeInsets.only(left: 10).w,
                          child: const StudiesWidget(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    spacing: 10.h,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context).skills,
                        style: AppTextStyle.bold18(context),
                      ),
                      const SizedBox(),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0).w,
                        child: Wrap(
                          children: List.generate(
                            18,
                            (index) => const Wrap(
                              children: [
                                Text("Flutter"),
                                Text(" | "),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    spacing: 10.h,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context).language,
                        style: AppTextStyle.bold18(context),
                      ),
                      const SizedBox(),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0).w,
                        child: Wrap(
                          children: List.generate(
                            18,
                            (index) => const Wrap(
                              children: [
                                Text("English"),
                                Text(" | "),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 150,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class WorkWidget extends StatelessWidget {
  const WorkWidget({
    super.key,
    this.work,
  });
  final Experience? work;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileSelectableInfo(
          value: work?.companyName ?? "Almahd Technology",
          icon: const Icon(
            Icons.work_outline,
            size: 16,
          ),
        ),
        Text(
            work?.description ??
                "Graphic designers often gain experience through internships, which they may undertake while enrolled in a design program. Internships allow aspiring graphic designers to work with designers and to experience the design process from concept to completion",
            style: AppTextStyle.regular12(context).copyWith(
              color: Theme.of(context).textTheme.bodySmall!.color,
            )).withPaddingLeft(16),
        Text(
                work == null
                    ? "22-2-2020 => 24-2-2022 (5 Years)"
                    : "${DateFormat('dd-MM-yyyy').format(work!.startDate!)} => ${work!.isWorkingNow! ? "Now" : DateFormat('dd-MM-yyyy').format(work!.endDate!)}  (${work!.endDate!.year - work!.startDate!.year} Years)",
                style: AppTextStyle.regular12(context))
            .withPaddingLeft(16),
        const SizedBox()
      ],
    );
  }
}

class StudiesWidget extends StatelessWidget {
  const StudiesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ProfileSelectableInfo(
          value:
              "Animation Transaction Course With Translation And Camera Position",
          icon: Icon(
            Icons.class_outlined,
            size: 16,
          ),
        ),
        Text(
            "Graphic designers often gain experience through internships, which they may undertake while enrolled in a design program. Internships allow aspiring graphic designers to work with designers and to experience the design process from concept to completion",
            style: AppTextStyle.regular12(context).copyWith(
              color: Theme.of(context).textTheme.bodySmall!.color,
            )).withPaddingLeft(16),
        Text("22-2-2020 => 24-2-2022 5 Years",
                style: AppTextStyle.regular12(context))
            .withPaddingLeft(16),
        const SizedBox()
      ],
    );
  }
}

class ProfileSelectableInfo extends StatelessWidget {
  const ProfileSelectableInfo({
    super.key,
    required this.icon,
    required this.value,
  });
  final Widget icon;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        icon,
        SizedBox(
          width: 5.w,
        ),
        Expanded(
            child:
                SelectableText(value, style: AppTextStyle.regular14(context))),
      ],
    );
  }
}
