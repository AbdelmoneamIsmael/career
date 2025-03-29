import 'package:career/core/app_texts/app_localizations.dart';
import 'package:career/core/bloc/app_bloc.dart';
import 'package:career/core/routes/pages_keys.dart';
import 'package:career/core/themes/styles/app_text_style.dart';
import 'package:career/core/utils/functions/initialize_getit/initialize_getit.dart';
import 'package:career/core/widgets/app_text_field.dart';
import 'package:career/core/widgets/loading_over_lay.dart';
import 'package:career/core/widgets/primary_button.dart';
import 'package:career/core/widgets/screen_wrapper.dart';
import 'package:career/core/widgets/ui_function.dart';
import 'package:career/features/business_login/domain/usecases/login_use_case.dart';
import 'package:career/features/business_login/presentation/cubit/business_login_cubit.dart';
import 'package:career/features/business_login/presentation/cubit/business_login_state.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:motion_toast/resources/arrays.dart';

class LoginAsBusiness extends StatelessWidget {
  const LoginAsBusiness({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BusinessLoginCubit(
        appBloc: context.read<AppBloc>(),
        loginUseCase: getIt.get<LoginUseCase>(),
      ),
      child: ScreenWrapper(
        appBar: AppBar(),
        body: BlocConsumer<BusinessLoginCubit, BusinessLoginState>(
          listener: (context, state) {
            if (state is ErrorLogin) {
              UiHelper.showSnakBar(
                  message: state.message,
                  context: context,
                  type: MotionToastType.error);
            } else if (state is SuccessLogin) {
              if (state.loginResponseModel.data!.phoneNumber != null) {
                String phoneNumber =
                    state.loginResponseModel.data!.phoneNumber!;
                GoRouter.of(context).pushNamed(
                  PagesKeys.otpScreen,
                  extra: phoneNumber,
                );
              } else {
                UiHelper.showSnakBar(
                    message: state.loginResponseModel.data!.message!,
                    context: context,
                    type: MotionToastType.info);
              }
            }
          },
          builder: (context, state) {
            final cubit = BlocProvider.of<BusinessLoginCubit>(context);
            return Stack(
              children: [
                CustomScrollView(
                  physics: const ClampingScrollPhysics(),
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20).w,
                            margin: const EdgeInsets.all(22).w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                            ),
                            child: Form(
                              key: cubit.formKey,
                              child: AutofillGroup(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: 16.h,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context).login,
                                      style: AppTextStyle.bold30h45(context),
                                    ),
                                    AppTextField(
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
                                      controller: cubit.emailController,
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
                                      hint: AppLocalizations.of(context)
                                          .paswordHint,
                                      suffixIcon: Icon(
                                        Icons.visibility_sharp,
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .color,
                                      ),
                                    ),
                                    const SizedBox(),
                                    GestureDetector(
                                      onTap: () {
                                        GoRouter.of(context).pushNamed(
                                          PagesKeys.resetPassword,
                                        );
                                      },
                                      child: Text(
                                        AppLocalizations.of(context)
                                            .forgetPassword,
                                        style: AppTextStyle.regular14(context)
                                            .copyWith(),
                                      ),
                                    ),
                                    const SizedBox(),
                                    Center(
                                      child: PrimaryButton(
                                        onPressed: () {
                                          cubit.login(context: context);
                                        },
                                        fixedSize: false,
                                        loading: false,
                                        text:
                                            AppLocalizations.of(context).signIn,
                                      ),
                                    ),
                                    const SizedBox(),
                                    RichText(
                                      text: TextSpan(
                                        text: AppLocalizations.of(context)
                                            .dontHaveAccount,
                                        style: AppTextStyle.regular14(context)
                                            .copyWith(),
                                        children: [
                                          TextSpan(
                                            text: " ",
                                            style:
                                                AppTextStyle.regular14(context)
                                                    .copyWith(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                          ),
                                          TextSpan(
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                GoRouter.of(context).pushNamed(
                                                  PagesKeys.registerAsBusiness,
                                                );
                                              },
                                            text: AppLocalizations.of(context)
                                                .register,
                                            style:
                                                AppTextStyle.regular14(context)
                                                    .copyWith(
                                              color: Theme.of(context)
                                                  .primaryColor,
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
                ),
                Visibility(
                  visible: state is LoadingLoginProcess,
                  child: const LoadingOverlay(),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
