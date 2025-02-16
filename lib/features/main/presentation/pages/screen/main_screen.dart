import 'dart:ui';

import 'package:career/core/widgets/primary_container.dart';
import 'package:career/core/widgets/screen_wrapper.dart';
import 'package:career/features/main/presentation/cubit/main_cubit.dart';
import 'package:career/features/main/presentation/pages/widgets/career_nav_bar.dart';
import 'package:career/features/main_screen/presentation/cubit/main_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key, required this.fullpath, required this.child});
  final String fullpath;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(
        context: context,
        path: fullpath,
      ),
      child: BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            body: Stack(
              clipBehavior: Clip.none,
              fit: StackFit.expand,
              children: [
                child,
                Positioned(
                  bottom: 28.h,
                  right: 16.w,
                  left: 16.w,
                  child: const CareerBottomNavBar(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
