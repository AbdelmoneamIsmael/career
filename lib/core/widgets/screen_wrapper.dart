import 'dart:ui';

import 'package:career/core/bloc/app_bloc.dart';
import 'package:career/core/bloc/app_state.dart';
import 'package:career/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenWrapper extends StatelessWidget {
  const ScreenWrapper({
    this.applayAnotation = true,
    super.key,
    required this.body,
    this.statusAppBarColor,
    this.backGroundColor,
    this.resizeToAvoidBottomInset,
    this.extendBodyBehindAppBar,
    this.floatingActionButton,
    this.onWillPop,
    this.appBar,
    this.bottomNavigationBar,
    this.onPopInvoked,
    this.drawer,
    this.backgroundImage,
  });

  final Widget body;
  final Color? statusAppBarColor;
  final Color? backGroundColor;
  final bool? resizeToAvoidBottomInset;
  final bool? extendBodyBehindAppBar;
  final Widget? floatingActionButton, drawer;
  final bool? onWillPop, applayAnotation;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final void Function(bool)? onPopInvoked;
  final DecorationImage? backgroundImage;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: onWillPop ?? true,
      onPopInvoked: onPopInvoked,
      child: BlocConsumer<AppBloc, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          // var cubit = BlocProvider.of<AppCubit>(context);
          return GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: const TextScaler.linear(1),
              ),
              child: Container(
                decoration: BoxDecoration(
                  image: backgroundImage ??
                      DecorationImage(
                        image: AssetImage(
                          Assets.images.backgroundImage.path,
                        ),
                        fit: BoxFit.cover,
                        alignment: Alignment(lerpDouble(.6, -.5, .07)!, 0),
                      ),
                ),
                child: Scaffold(
                  drawer: drawer,
                  bottomNavigationBar: bottomNavigationBar,
                  appBar: appBar ??
                      AppBar(
                        backgroundColor: Colors.transparent,
                      ),
                  floatingActionButton: floatingActionButton,
                  extendBodyBehindAppBar: extendBodyBehindAppBar ?? false,
                  resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? false,
                  body: applayAnotation!
                      ? AnnotatedRegion(
                          value: const SystemUiOverlayStyle(
                            statusBarBrightness: Brightness.light,
                            statusBarIconBrightness: Brightness.light,
                          ),
                          child: SafeArea(
                            left: false,
                            bottom: false,
                            right: false,
                            child: body,
                          ),
                        )
                      : body,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
