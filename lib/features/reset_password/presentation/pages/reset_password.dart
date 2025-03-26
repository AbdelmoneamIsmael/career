import 'package:career/core/app_texts/app_localizations.dart';
import 'package:career/core/const/app_const.dart';
import 'package:career/core/themes/colors/colors.dart';
import 'package:career/core/themes/styles/app_text_style.dart';
import 'package:career/core/widgets/app_contry_code_picker.dart';
import 'package:career/core/widgets/app_text_field.dart';
import 'package:career/core/widgets/loading_over_lay.dart';
import 'package:career/core/widgets/primary_button.dart';
import 'package:career/core/widgets/primary_container.dart';
import 'package:career/core/widgets/screen_wrapper.dart';
import 'package:career/core/widgets/ui_function.dart';
import 'package:career/features/reset_password/presentation/cubit/reset_password_cubit.dart';
import 'package:career/features/reset_password/presentation/cubit/reset_password_state.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
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
              type: MotionToastType.error);
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

class EnterPhoneView extends StatelessWidget {
  const EnterPhoneView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<ResetPasswordCubit>(context);
        return PrimaryContainer(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppLocalizations.of(context).enterPhoneNumber,
                style: AppTextStyle.bold24h27(context),
              ),
              const SizedBox(
                height: 30,
              ),
              AppTextField(
                hint: AppLocalizations.of(context).phone,
                prefixIcon: CountryCodePrefixIcon(
                  onChanged: (value) {
                    cubit.countryCode = value.dialCode!;
                  },
                ),
                autofillHints: [AutofillHints.telephoneNumber],
                keyboardType: TextInputType.phone,
                controller: cubit.phoneController,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppLocalizations.of(context).enterPhoneNumber;
                  } else if (value.length < 9) {
                    return AppLocalizations.of(context).phoneNotValid;
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: PrimaryButton(
                  text: AppLocalizations.of(context).next,
                  onPressed: cubit.validatePhone,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class OtpAndPassowrdView extends StatelessWidget {
  const OtpAndPassowrdView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<ResetPasswordCubit>(context);
        return PrimaryContainer(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppLocalizations.of(context).otpVerification,
                style: AppTextStyle.medium16(context),
              ),
              const SizedBox(
                height: 30,
              ),
              OtpTextField(
                numberOfFields: 6,
                borderColor: LightColors.buttonColor,
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },

                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                //runs when every textfield is filled
                onSubmit: cubit.submitOtp, // end onSubmit
              ),
              const SizedBox(
                height: 30,
              ),
              AppTextField(
                hint: AppLocalizations.of(context).password,
                autofillHints: [AutofillHints.password],
                scure: true,
                prefixIcon: const Icon(
                  Icons.lock,
                ),
                controller: cubit.passwordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppLocalizations.of(context).enterPassword;
                  } else if (value.length < 6) {
                    return AppLocalizations.of(context).passwordNotVailid;
                  }
                  return null;
                },
              ),
              AppTextField(
                hint: AppLocalizations.of(context).confirmPassword,
                autofillHints: [AutofillHints.password],
                scure: true,
                prefixIcon: const Icon(
                  Icons.lock,
                ),
                controller: cubit.confirmPasswordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppLocalizations.of(context).enterPassword;
                  } else if (value != cubit.passwordController.text) {
                    return AppLocalizations.of(context).passwordNotMatch;
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: PrimaryButton(
                  text: AppLocalizations.of(context).next,
                  onPressed: cubit.passWordValidate,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
