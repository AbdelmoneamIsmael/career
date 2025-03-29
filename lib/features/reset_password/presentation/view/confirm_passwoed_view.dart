import 'package:career/core/app_texts/app_localizations.dart';
import 'package:career/core/themes/colors/colors.dart';
import 'package:career/core/themes/styles/app_text_style.dart';
import 'package:career/core/widgets/app_text_field.dart';
import 'package:career/core/widgets/primary_button.dart';
import 'package:career/core/widgets/primary_container.dart';
import 'package:career/features/reset_password/presentation/cubit/reset_password_cubit.dart';
import 'package:career/features/reset_password/presentation/cubit/reset_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

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
          child: Form(
            key: cubit.formKey,
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
          ),
        );
      },
    );
  }
}
