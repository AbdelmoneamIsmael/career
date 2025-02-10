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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PrimaryContainer(
                        child: Form(
                          key: cubit.formKey,
                          child: AutofillGroup(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 16.h,
                              children: [
                                Text(
                                  AppLocalizations.of(context).register,
                                  style: AppTextStyle.bold30h45(context),
                                ),
                                AppTextField(
                                  controller: cubit.emailController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return AppLocalizations.of(context)
                                          .emailRequired;
                                    }
                                    return null;
                                  },
                                  autofillHints: [
                                    AutofillHints.email,
                                    AutofillHints.username,
                                  ],
                                  hint: "career@gmail.com",
                                  suffixIcon: Icon(
                                    Icons.email,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .color,
                                  ),
                                ),
                                AppTextField(
                                  controller: cubit.passwordController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return AppLocalizations.of(context)
                                          .passwordRequired;
                                    }
                                    return null;
                                  },
                                  autofillHints: [AutofillHints.password],
                                  hint:
                                      AppLocalizations.of(context).paswordHint,
                                  suffixIcon: Icon(
                                    Icons.visibility_sharp,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .color,
                                  ),
                                ),
                                const SizedBox(),
                                Text(
                                  AppLocalizations.of(context).forgetPassword,
                                  style: AppTextStyle.regular14(context)
                                      .copyWith(),
                                ),
                                const SizedBox(),
                                Center(
                                  child: PrimaryButton(
                                    onPressed: cubit.register,
                                    fixedSize: false,
                                    loading: false,
                                    text: AppLocalizations.of(context).signIn,
                                  ),
                                ),
                                const SizedBox(),
                                RichText(
                                  text: TextSpan(
                                    text: AppLocalizations.of(context)
                                        .alreadyHaveAccount,
                                    style: AppTextStyle.regular14(context)
                                        .copyWith(),
                                    children: [
                                      TextSpan(
                                        text: " ",
                                        style: AppTextStyle.regular14(context)
                                            .copyWith(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                      TextSpan(
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            GoRouter.of(context).pushNamed(
                                                PagesKeys.loginAsPerson);
                                          },
                                        text:
                                            AppLocalizations.of(context).login,
                                        style: AppTextStyle.regular14(context)
                                            .copyWith(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
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
