import 'package:career/core/bloc/app_bloc.dart';
import 'package:career/core/const/enums.dart';
import 'package:career/core/routes/pages_keys.dart';
import 'package:career/features/business_login/presentation/pages/login_as_company.dart';
import 'package:career/features/candidates/presentation/page/candidates_page.dart';
import 'package:career/features/company_page/presentation/page/company_page.dart';
import 'package:career/features/create_post/presentation/cubit/create_post_cubit.dart';
import 'package:career/features/create_post/presentation/pages/create_post_screen.dart';
import 'package:career/features/home_screen/presentation/cubit/home_screen_cubit.dart';
import 'package:career/features/home_screen/presentation/pages/home_screen.dart';
import 'package:career/features/home_screen/presentation/views/fillter_sheet.dart';
import 'package:career/features/main/presentation/cubit/main_cubit.dart';
import 'package:career/features/main/presentation/pages/screen/main_screen.dart';
import 'package:career/features/notification/presentation/ui/pages/notifications_page.dart';
import 'package:career/features/otp_screen/presentation/cubit/otp_screen_cubit.dart';
import 'package:career/features/otp_screen/presentation/pages/otp_screen.dart';
import 'package:career/features/person_login/presentation/pages/login_as_person.dart';
import 'package:career/features/post_details/presentation/pages/post_details.dart';
import 'package:career/features/profile_screen/presentation/pages/profile_screen.dart';
import 'package:career/features/register_as_business/presentation/page/register_as_business.dart';
import 'package:career/features/register_as_person/presentation/pages/register_as_person.dart';
import 'package:career/features/setting_screen/presentation/pages/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:career/core/const/app_const.dart';
import 'package:career/features/onboarding/presentation/pages/onbaording.dart';
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
                  context.read<MainCubit>().getIndex(pagePath: state.fullPath!);
                  return const HomeScreen();
                },
              ),
              GoRoute(
                name: PagesKeys.profileScreen,
                path: "/${PagesKeys.profileScreen}",
                builder: (context, state) {
                  context.read<MainCubit>().getIndex(pagePath: state.fullPath!);
                  switch (context.read<AppBloc>().visitorType) {
                    case VisitorType.person:
                      return const ProfileScreen();
                    case VisitorType.business:
                      return const CompanyPage();
                    case VisitorType.guest:
                      const SizedBox();
                    case VisitorType.admin:
                      const SizedBox();
                  }
                  return const SizedBox();
                },
              ),
              GoRoute(
                name: PagesKeys.notificationspage,
                path: "/${PagesKeys.notificationspage}",
                builder: (context, state) {
                  context.read<MainCubit>().getIndex(pagePath: state.fullPath!);
                  return const NotificationsPage();
                },
              ),
              GoRoute(
                name: PagesKeys.settingsScreen,
                path: "/${PagesKeys.settingsScreen}",
                builder: (context, state) {
                  context.read<MainCubit>().getIndex(pagePath: state.fullPath!);
                  return const SettingsScreen();
                },
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        name: PagesKeys.postDetails,
        path: "/${PagesKeys.postDetails}",
        builder: (context, state) {
          return const PostDetails();
        },
      ),
      GoRoute(
        name: PagesKeys.companyPage,
        path: "/${PagesKeys.companyPage}",
        builder: (context, state) {
          return const CompanyPage();
        },
      ),
      GoRoute(
        name: PagesKeys.fillterPage,
        path: "/${PagesKeys.fillterPage}",
        builder: (context, state) {
          return BlocProvider.value(
            value: state.extra as HomeScreenCubit,
            child: const FillterPage(),
          );
        },
      ),
      GoRoute(
        name: PagesKeys.candidatesPage,
        path: "/${PagesKeys.candidatesPage}",
        builder: (context, state) {
          return const CandidatesPage();
        },
      ),
      GoRoute(
        name: PagesKeys.registerAsBusiness,
        path: "/${PagesKeys.registerAsBusiness}",
        builder: (context, state) {
          return const RegisterAsBusiness();
        },
      ),
      GoRoute(
        name: PagesKeys.createPost,
        path: "/${PagesKeys.createPost}",
        builder: (context, state) {
          return BlocProvider(
            create: (context) => CreatePostCubit(context: context),
            child: const CreatePostScreen(),
          );
        },
      ),
      GoRoute(
        name: PagesKeys.otpScreen,
        path: "/${PagesKeys.otpScreen}",
        builder: (context, state) {
          return BlocProvider(
            create: (context) => OtpScreenCubit(),
            child: const OtpScreen(),
          );
        },
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
