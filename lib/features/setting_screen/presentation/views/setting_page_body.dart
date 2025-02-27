import 'package:career/core/themes/styles/app_text_style.dart';
import 'package:career/features/setting_screen/presentation/views/setting_page_item.dart';
import 'package:career/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';

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
              child: FlutterSwitch(
                width: 46.0,
                height: 22.0,
                valueFontSize: 14.0,
                toggleSize: 13.0,
                value: true,
                // borderRadius: 30.0,
                // padding: 8.0,
                activeColor: Colors.green,
                showOnOff: true,
                onToggle: (val) {
                  // setState(() {
                  //   status = val;
                  // });
                },
              ),
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