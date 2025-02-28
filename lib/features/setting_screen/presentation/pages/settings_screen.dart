import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:career/core/widgets/screen_wrapper.dart';
import 'package:career/features/setting_screen/presentation/views/setting_page_app_bar.dart';
import 'package:career/features/setting_screen/presentation/views/setting_page_body.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: ScreenWrapper(
        backGroundColor: Theme.of(context).colorScheme.primaryContainer,
        body: const CustomScrollView(
          slivers: [
            SettingPageAppBar(),
            SettingPageBody(),
          ],
        ),
      ),
    );
  }
}
