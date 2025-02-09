import 'package:career/core/app_texts/app_localizations.dart';
import 'package:career/core/routes/pages_keys.dart';
import 'package:career/core/themes/styles/app_text_style.dart';
import 'package:career/core/widgets/screen_wrapper.dart';
import 'package:career/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:career/features/main_screen/presentation/widgets/main_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            Assets.images.applogo.path,
            height: 200,
            width: 200.w,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            AppLocalizations.of(context).areYou,
            style: AppTextStyle.bold30h45(context),
          ),
          SizedBox(
            height: 40.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0).w,
            child: Column(
              spacing: 20.h,
              children: [
                ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).pushNamed(PagesKeys.loginAsPerson);
                  },
                  child: Text(
                    AppLocalizations.of(context).person,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).pushNamed(PagesKeys.loginAsCompany);
                  },
                  child: Text(
                    AppLocalizations.of(context).business,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    AppLocalizations.of(context).guest,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
