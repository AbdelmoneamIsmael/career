import 'package:career/core/app_texts/app_localizations.dart';
import 'package:career/core/const/app_const.dart';

import 'package:career/core/widgets/loading_over_lay.dart';

import 'package:career/core/widgets/screen_wrapper.dart';
import 'package:career/core/widgets/ui_function.dart';
import 'package:career/features/reset_password/presentation/cubit/reset_password_cubit.dart';
import 'package:career/features/reset_password/presentation/cubit/reset_password_state.dart';
import 'package:career/features/reset_password/presentation/view/confirm_passwoed_view.dart';
import 'package:career/features/reset_password/presentation/view/enter_phone_view.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motion_toast/resources/arrays.dart';

class ResetPassMobileScreen extends StatelessWidget {
  const ResetPassMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ErrorCheckPhoneState) {
          UiHelper.showSnakBar(
              message: state.message,
              context: context,
              type: MotionToastType.error);
        } else if (state is ErrorChangePasswordState) {
          UiHelper.showSnakBar(
            message: state.message,
            context: context,
            type: MotionToastType.error,
          );
        } else if (state is SuccessChangePasswordState) {
          UiHelper.showSnakBar(
              message: AppLocalizations.of(context).passwordChangedSuccessfully,
              context: context,
              type: MotionToastType.success);
        }
      },
      builder: (context, state) {
        final controller = BlocProvider.of<ResetPasswordCubit>(context);
        return Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [
            ScreenWrapper(
              appBar: AppBar(),
              body: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ExpandablePageView(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: controller.pageController,
                          children: [
                            const EnterPhoneView(),
                            const OtpAndPassowrdView(),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Visibility(
              visible: state is LoadingCheckPhoneState ||
                  state is LoadingChangePasswordState,
              child: getIt.get<LoadingOverlay>(),
            )
          ],
        );
      },
    );
  }
}
