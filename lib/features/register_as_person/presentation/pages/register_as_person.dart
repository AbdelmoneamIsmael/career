import 'dart:ui';

import 'package:career/core/app_texts/app_localizations.dart';
import 'package:career/core/routes/pages_keys.dart';
import 'package:career/core/themes/styles/app_text_style.dart';
import 'package:career/core/widgets/app_text_field.dart';
import 'package:career/core/widgets/primary_button.dart';
import 'package:career/core/widgets/primary_container.dart';
import 'package:career/core/widgets/screen_wrapper.dart';
import 'package:career/features/register_as_person/presentation/cubit/register_as_person_cubit.dart';
import 'package:career/gen/assets.gen.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RegisterAsPerson extends StatelessWidget {
  const RegisterAsPerson({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterAsPersonCubit(),
      child: ScreenWrapper(
        backgroundImage: DecorationImage(
          image: AssetImage(
            Assets.images.signIn.path,
          ),
          fit: BoxFit.cover,
          alignment: Alignment(lerpDouble(-.55, .1, 0)!, 0),
        ),
        body: BlocConsumer<RegisterAsPersonCubit, RegisterAsPersonState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            final cubit = BlocProvider.of<RegisterAsPersonCubit>(context);
            return CustomScrollView(
              physics: const ClampingScrollPhysics(),
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: ExpandablePageView(
                    onPageChanged: cubit.setVAlue,
                    controller: cubit.controller,
                    children: [
                      
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
