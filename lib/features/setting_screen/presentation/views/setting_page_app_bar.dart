import 'package:career/core/themes/colors/colors.dart';
import 'package:career/core/themes/styles/app_text_style.dart';
import 'package:career/core/widgets/primary_button.dart';
import 'package:career/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingPageAppBar extends StatelessWidget {
  const SettingPageAppBar({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      actions: [],
      floating: false,
      pinned: true,
      elevation: 0,
      primary: true,
      // shadowColor: LightColors.textColor,
      snap: false,
      stretch: true,
      toolbarHeight: kToolbarHeight,
      collapsedHeight: kToolbarHeight,
      stretchTriggerOffset: 100,
      expandedHeight: MediaQuery.sizeOf(context).height * .40,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        stretchModes: const [
          StretchMode.fadeTitle,
          StretchMode.blurBackground,
          StretchMode.zoomBackground
        ],
        background: Container(
          color: LightColors.containerColor,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(
                  flex: 4,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(40.r),
                  child: Image.asset(
                    Assets.images.profile.path,
                    height: 80.w,
                    width: 80.w,
                    fit: BoxFit.cover,
                  ),
                ),
                10.verticalSpace,
                Text(
                  'Amr Mohamed',
                  style: AppTextStyle.bold16(context),
                ),
                5.verticalSpace,
                Text(
                  'UI/UX Designer',
                  style: AppTextStyle.regular14(context),
                ),
                10.verticalSpace,
                SizedBox(
                  height: 33,
                  child: PrimaryButton(
                    backgroundColor: LightColors.orangeColor,
                    text: 'Upgrade Now - Go Pro',
                    onPressed: () {},
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
              ]),
        ),
      ),
      // const SizedBox(
      //   height: 12,
      // ),
      // Text(
      //   AppLocalizations.of(context).propertyNum,
      //   style: AppTextStyle.semiBold.copyWith(
      //     color: AppColors.greyPrimary,
      //     fontSize: 14,
      //     fontWeight: FontWeight.w600,
      //     height: 1.8,
      //   ),
      // ),
      // const Spacer(),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(25),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xffEAE8E9),
            borderRadius: BorderRadiusDirectional.only(
              topEnd: Radius.circular(24),
              topStart: Radius.circular(24),
            ),
          ),
          height: 25,
        ),
      ),
    );
  }
}
