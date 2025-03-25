import 'package:career/core/app_texts/app_localizations.dart';
import 'package:career/core/routes/pages_keys.dart';
import 'package:career/core/themes/colors/colors.dart';
import 'package:career/core/themes/styles/app_text_style.dart';
import 'package:career/core/utils/functions/initialize_getit/initialize_getit.dart';
import 'package:career/core/widgets/loading_over_lay.dart';
import 'package:career/core/widgets/primary_container.dart';
import 'package:career/core/widgets/screen_wrapper.dart';
import 'package:career/core/widgets/ui_function.dart';
import 'package:career/features/otp_screen/presentation/cubit/otp_screen_cubit.dart';
import 'package:career/features/otp_screen/presentation/cubit/otp_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:motion_toast/resources/arrays.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OtpScreenCubit, OtpScreenState>(
      listener: (context, state) {
        if (state is SuccessOtpConfirmationProccess) {
          GoRouter.of(context)
              .push("/${PagesKeys.mainScreen}/${PagesKeys.homeScreen}");
        } else {
          if (state is FailedOtpConfirmationProccess) {
            UiHelper.showSnakBar(
                message: state.message,
                context: context,
                type: MotionToastType.error);
          }
        }
      },
      builder: (context, state) {
        final cubit = context.read<OtpScreenCubit>();
        return Stack(
          children: [
            ScreenWrapper(
              appBar: AppBar(),
              body: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        PrimaryContainer(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 50,
                          ).w,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              OtpTextField(
                                numberOfFields: 6,
                                borderColor: LightColors.buttonColor,
                                //set to true to show as box or false to show as dash
                                showFieldAsBox: true,
                                //runs when a code is typed in
                                onCodeChanged: (String code) {
                                  //handle validation or checks here
                                },

                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                //runs when every textfield is filled
                                onSubmit: cubit.submitOtp, // end onSubmit
                              ),
                              const SizedBox(height: 40),
                              Text(
                                textAlign: TextAlign.center,
                                AppLocalizations.of(context).otpVerification,
                                style: AppTextStyle.medium18(context),
                              ),
                              const SizedBox(height: 20),
                              TextButton(
                                  onPressed: cubit.resendOtp,
                                  child: Text(
                                    AppLocalizations.of(context).resendOtp,
                                    style: AppTextStyle.medium16(context)
                                        .copyWith(
                                            color: LightColors.buttonColor),
                                  )),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).viewInsets.bottom,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: state is LoadingOtpConfirmationProccess,
              child: getIt.get<LoadingOverlay>(),
            )
          ],
        );
      },
    );
  }
}
