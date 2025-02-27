import 'package:career/core/themes/styles/app_text_style.dart';
import 'package:career/core/widgets/screen_wrapper.dart';
import 'package:career/features/setting_screen/presentation/views/setting_page_app_bar.dart';
import 'package:career/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      backGroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: const CustomScrollView(
        slivers: [
          SettingPageAppBar(),
          SettingPageBody(),
        ],
      ),
    );
  }
}

class SettingPageBody extends StatelessWidget {
  const SettingPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Settings',
              style: AppTextStyle.bold24h27(context),
            ),
            SettingPageItem(
              path: Assets.images.mode.path,
              title: 'Dark Mode',
              child: Switch(value: true, onChanged: (val) {}),
            ),
            SettingPageItem(
              path: Assets.images.language.path,
              title: 'Language',
            ),
            SettingPageItem(
              path: Assets.images.notification.path,
              title: 'Notification',
              child: Row(
                children: [
                  Text(
                    'on',
                    style: AppTextStyle.bold16(context),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  ),
                ],
              ),
            ),
            SettingPageItem(
              path: Assets.images.privacy.path,
              title: 'Privicy',
            ),
            SettingPageItem(
              path: Assets.images.verified.path,
              title: 'Security',
            ),
            SettingPageItem(
              path: Assets.images.user.path,
              title: 'Account',
            ),
            SettingPageItem(
              path: Assets.images.question.path,
              title: 'Help',
            ),
            SettingPageItem(
              path: Assets.images.about.path,
              title: 'Apout',
            ),
            SettingPageItem(
              path: Assets.images.logout.path,
              title: 'Log out',
            ),
            200.verticalSpace,
          ],
        ),
      ),
    );
  }
}

class SettingPageItem extends StatelessWidget {
  const SettingPageItem({
    super.key,
    required this.title,
    this.child,
    required this.path,
  });
  final String title, path;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                path,
                fit: BoxFit.scaleDown,
                width: 20.w,
                height: 20.h,
                color: Theme.of(context).colorScheme.shadow,
              ),
              15.horizontalSpace,
              Text(title, style: AppTextStyle.bold16(context)),
            ],
          ),
          child ??
              const Icon(
                Icons.arrow_forward_ios,
                size: 15,
              ),
        ],
      ),
    );
  }
}
