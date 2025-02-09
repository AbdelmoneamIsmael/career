import 'package:career/core/routes/pages_keys.dart';
import 'package:career/features/business_login/presentation/pages/login_as_company.dart';
import 'package:career/features/person_login/presentation/pages/login_as_person.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:career/core/const/app_const.dart';
import 'package:career/features/main_screen/presentation/pages/main_screen.dart';
import 'package:career/core/bloc/bloc_observer.dart';

class PageRoutes {
  static GoRouter router = GoRouter(
    errorBuilder: (context, state) => const ErorPage(),
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
          ),
          GoRoute(
            name: PagesKeys.loginAsCompany,
            path: "/${PagesKeys.loginAsCompany}",
            builder: (context, state) {
              return const LoginAsBusiness();
            },
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
