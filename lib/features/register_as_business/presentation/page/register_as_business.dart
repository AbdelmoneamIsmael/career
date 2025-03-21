import 'dart:ui';
import 'package:career/core/utils/functions/initialize_getit/initialize_getit.dart';
import 'package:career/core/widgets/loading_over_lay.dart';
import 'package:career/core/widgets/screen_wrapper.dart';
import 'package:career/core/widgets/ui_function.dart';
import 'package:career/features/register_as_business/domain/repo/reister_business_repo.dart';
import 'package:career/features/register_as_business/presentation/manager/business_cubit.dart';
import 'package:career/features/register_as_business/presentation/manager/business_state.dart';
import 'package:career/features/register_as_business/presentation/view/business_core_information.dart';
import 'package:career/features/register_as_business/presentation/view/company_image.dart';
import 'package:career/features/register_as_business/presentation/view/company_info.dart';
import 'package:career/features/register_as_business/presentation/view/company_language.dart';
import 'package:career/gen/assets.gen.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:motion_toast/resources/arrays.dart';

class RegisterAsBusiness extends StatelessWidget {
  const RegisterAsBusiness({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterAsBusinessCubit(
          registerBusinessRepo: getIt.get<RegisterBusinessRepo>()),
      child: ScreenWrapper(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            ),
            onPressed: () => context.pop(),
          ),
        ),
        backgroundImage: DecorationImage(
          image: AssetImage(
            Assets.images.signIn.path,
          ),
          fit: BoxFit.cover,
          alignment: Alignment(lerpDouble(-.55, .1, 0)!, 0),
        ),
        body: BlocConsumer<RegisterAsBusinessCubit, RegisterBusinessState>(
          listener: (context, state) {
            if (state is SuccessRegister) {
              context.pop();
            }
            if (state is ErrorRegister) {
              UiHelper.showSnakBar(
                message: state.error,
                context: context,
                type: MotionToastType.error,
              );
            }
          },
          builder: (context, state) {
            final cubit = BlocProvider.of<RegisterAsBusinessCubit>(context);
            return Stack(
              children: [
                CustomScrollView(
                  physics: const ClampingScrollPhysics(),
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: ExpandablePageView(
                        onPageChanged: cubit.setVAlue,
                        controller: cubit.pageController,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          const CompanyImage(),
                          const BusinessCoreInformation(),
                          const ComPanyInfo(),
                          const BusinessAddressInformation(),
                        ],
                      ),
                    ),
                  ],
                ),
                Visibility(
                  visible: state is LoadingRegister,
                  child: const LoadingOverlay(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
