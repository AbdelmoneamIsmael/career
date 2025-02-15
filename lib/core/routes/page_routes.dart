import 'package:career/core/routes/pages_keys.dart';
import 'package:career/features/business_login/presentation/pages/login_as_company.dart';
import 'package:career/features/home_screen/presentation/pages/home_screen.dart';
import 'package:career/features/main/presentation/cubit/main_cubit.dart';
import 'package:career/features/main/presentation/pages/screen/main_screen.dart';
import 'package:career/features/notification_screen/presentation/pages/notificatoin_screen.dart';
import 'package:career/features/person_login/presentation/pages/login_as_person.dart';
import 'package:career/features/profile_screen/presentation/pages/profile_screen.dart';
import 'package:career/features/register_as_person/presentation/pages/register_as_person.dart';
import 'package:career/features/setting_screen/presentation/pages/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:career/core/const/app_const.dart';
import 'package:career/features/main_screen/presentation/pages/main_screen.dart';
import 'package:career/core/bloc/bloc_observer.dart';

class PageRoutes {
  static final GlobalKey<NavigatorState> shellNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'shell');

  static GoRouter router = GoRouter(
    errorBuilder: (context, state) {
      PrintHelper(state.error.toString());
      return const ErorPage();
    },
    initialLocation:
        initialRoute.isEmpty ? "/${PagesKeys.onBoardingScreen}" : initialRoute,
    observers: [
      MyNavigatorObserver(),
    ],
    routes: [
      GoRoute(
        name: PagesKeys.onBoardingScreen,
        path: "/${PagesKeys.onBoardingScreen}",
        builder: (context, state) {
          return const OnBoarding();
        },
        routes: [
          GoRoute(
              name: PagesKeys.loginAsPerson,
              path: "/${PagesKeys.loginAsPerson}",
              builder: (context, state) {
                return const LoginAsPerson();
              },
              routes: [
                GoRoute(
                  name: PagesKeys.registerAsPersonPage,
                  path: "/${PagesKeys.registerAsPersonPage}",
                  builder: (context, state) {
                    return const RegisterAsPerson();
                  },
                ),
              ]),
          GoRoute(
            name: PagesKeys.loginAsCompany,
            path: "/${PagesKeys.loginAsCompany}",
            builder: (context, state) {
              return const LoginAsBusiness();
            },
          ),
         ],
      ),
       GoRoute(
            name: PagesKeys.mainScreen,
            path: "/${PagesKeys.mainScreen}",
            builder: (context, state) {
              return MainScreen(
                fullpath: state.fullPath!,
                child: MainScreen(
                  fullpath: state.fullPath!,
                  child: const HomeScreen(),
                ),
              );
            },
            routes: [
              ShellRoute(
                navigatorKey: shellNavigatorKey,
                builder: (context, state, child) => MainScreen(
                  fullpath: state.fullPath!,
                  child: child,
                ),
                routes: [
                  GoRoute(
                    name: PagesKeys.homeScreen,
                    path: "/${PagesKeys.homeScreen}",
                    builder: (context, state) {
                      context
                          .read<MainCubit>()
                          .getIndex(pagePath: state.fullPath!);
                      return const HomeScreen();
                    },
                  ),
                  GoRoute(
                    name: PagesKeys.profileScreen,
                    path: "/${PagesKeys.profileScreen}",
                    builder: (context, state) {
                      context
                          .read<MainCubit>()
                          .getIndex(pagePath: state.fullPath!);
                      return const ProfileScreen();
                    },
                  ),
                  GoRoute(
                    name: PagesKeys.notificationsScreen,
                    path: "/${PagesKeys.notificationsScreen}",
                    builder: (context, state) {
                      context
                          .read<MainCubit>()
                          .getIndex(pagePath: state.fullPath!);
                      return const NotificatoinScreen();
                    },
                  ),
                  GoRoute(
                    name: PagesKeys.settingsScreen,
                    path: "/${PagesKeys.settingsScreen}",
                    builder: (context, state) {
                      context
                          .read<MainCubit>()
                          .getIndex(pagePath: state.fullPath!);
                      return const SettingsScreen();
                    },
                  ),
                ],
              ),
            ],
          ),
        
    ],
  );
  static clearAndNavigate(String path) {
    while (router.canPop() == true) {
      router.pop();
    }
    router.goNamed(path);
  }
}

class ErorPage extends StatelessWidget {
  const ErorPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Error"),
      ),
    );
  }
}

class MyNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    PrintHelper('Navogate To ${route.settings.name}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    PrintHelper('Back To ${route.settings.name}');
  }
}
