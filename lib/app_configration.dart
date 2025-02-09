import 'package:career/core/layout/mobile_layout_screen/mobile_layout_screen.dart';
import 'package:career/core/layout/select_layout_screen.dart';
import 'package:career/core/layout/tablet_layout_screen/tablet_layout_screen.dart.dart';
import 'package:career/core/layout/web_layout_screen/web_layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:career/core/bloc/app_bloc.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Career extends StatelessWidget {
  const Career({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
      ],
    );
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
    );

    return BlocProvider(
      create: (context) => AppBloc(),
      child: SelectLayoutSCreen(
        mobileBuilder: (context) => const MobileLayOut(),
        tabletBuilder: (context) => const TabletLayOut(),
        webBuilder: (context) => const WebLayOut(),
      ),
    );
  }
}
