import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:career/core/app_texts/app_localizations.dart';
import 'package:career/core/bloc/app_bloc.dart';
import 'package:career/core/bloc/app_event.dart';
import 'package:career/core/bloc/app_state.dart';
import 'package:career/core/model/app_model/app_model.dart';
import 'package:career/core/routes/pages_keys.dart';
import 'package:career/core/themes/styles/app_text_style.dart';
import 'package:career/core/themes/theme/custom_theme.dart';
import 'package:career/core/widgets/ui_function.dart';
import 'package:career/features/setting_screen/presentation/views/setting_page_item.dart';
import 'package:career/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:go_router/go_router.dart';

class SettingPageBody extends StatelessWidget {
  const SettingPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        final cubit = context.read<AppBloc>();
        return SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context).setting,
                  style: AppTextStyle.bold24h27(context),
                ),
                SettingPageItem(
                  path: Assets.images.mode.path,
                  title: AppLocalizations.of(context).mode,
                  child: ThemeSwitcher(
                    builder: (context) => FlutterSwitch(
                      width: 46.0,
                      height: 22.0,
                      valueFontSize: 14.0,
                      toggleSize: 13.0,
                      value: cubit.appModel.theme == ApplicationTheme.dark,
                      // borderRadius: 30.0,
                      // padding: 8.0,
                      activeColor: Colors.green,
                      showOnOff: true,
                      onToggle: (val) {
                        final brightness =
                            ThemeModelInheritedNotifier.of(context)
                                .theme
                                .brightness;
                        if (brightness == Brightness.dark) {
                          ThemeSwitcher.of(context).changeTheme(
                              theme: lightTheme,
                              isReversed: brightness == Brightness.dark);
                        } else {
                          ThemeSwitcher.of(context).changeTheme(
                              theme: darkTheme,
                              isReversed: brightness == Brightness.dark);
                        }
                        context.read<AppBloc>().add(
                              ChangeThemeEvent(),
                            );
                      },
                    ),
                  ),
                ),
                SettingPageItem(
                  path: Assets.images.language.path,
                  title: AppLocalizations.of(context).language,
                  onTab: () => cubit.add(
                    ChangeLanguageEvent(),
                  ),
                ),
                SettingPageItem(
                  path: Assets.images.notification.path,
                  title: AppLocalizations.of(context).notification,
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
                  title: AppLocalizations.of(context).privicy,
                ),
                SettingPageItem(
                  path: Assets.images.question.path,
                  title: AppLocalizations.of(context).help,
                ),
                SettingPageItem(
                  path: Assets.images.about.path,
                  title: AppLocalizations.of(context).about,
                ),
                SettingPageItem(
                  path: Assets.images.logout.path,
                  title: AppLocalizations.of(context).logOut,
                  onTab: () async {
                    bool result = await UiHelper.showDialog(
                      message: AppLocalizations.of(context).signoutDescription,
                      context: context,
                      title: AppLocalizations.of(context).signout,
                    );
                    if (result) {
                      cubit.add(
                        LogOutEvent(),
                      );
                    }
                  },
                ),
                200.verticalSpace,
              ],
            ),
          ),
        );
      },
    );
  }
}
