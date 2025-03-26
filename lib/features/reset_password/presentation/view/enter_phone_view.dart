import 'package:career/core/app_texts/app_localizations.dart';
import 'package:career/core/themes/styles/app_text_style.dart';
import 'package:career/core/widgets/app_contry_code_picker.dart';
import 'package:career/core/widgets/app_text_field.dart';
import 'package:career/core/widgets/primary_button.dart';
import 'package:career/core/widgets/primary_container.dart';
import 'package:career/features/reset_password/presentation/cubit/reset_password_cubit.dart';
import 'package:career/features/reset_password/presentation/cubit/reset_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
