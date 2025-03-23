import 'dart:ui';

import 'package:career/core/utils/functions/initialize_getit/initialize_getit.dart';
import 'package:career/core/widgets/loading_over_lay.dart';
import 'package:career/core/widgets/screen_wrapper.dart';
import 'package:career/core/widgets/ui_function.dart';
import 'package:career/features/register_as_business/presentation/manager/business_state.dart';
import 'package:career/features/register_as_person/domain/repositories/register_person_repo.dart';
import 'package:career/features/register_as_person/presentation/cubit/register_as_person_cubit.dart';
import 'package:career/features/register_as_person/presentation/cubit/register_as_person_state.dart';
import 'package:career/features/register_as_person/presentation/views/cirtifications/cirtifications.dart';
import 'package:career/features/register_as_person/presentation/views/core_information/core_information.dart';
import 'package:career/features/register_as_person/presentation/views/cv_info/cv_view_info.dart';
import 'package:career/features/register_as_person/presentation/views/profile_image/profile_image.dart';
import 'package:career/features/register_as_person/presentation/views/studies/studies.dart';
import 'package:career/features/register_as_person/presentation/views/user_skills.dart/user_skills.dart';
import 'package:career/features/register_as_person/presentation/views/works/work_experiances.dart';
import 'package:career/gen/assets.gen.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:motion_toast/resources/arrays.dart';

class RegisterAsPerson extends StatelessWidget {
  const RegisterAsPerson({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterAsPersonCubit(
        getIt.get<RegisterPersonRepo>(),
      ),
      child: ScreenWrapper(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.close,
              color: Theme.of(context).textTheme.bodyMedium!.color,
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
        body: BlocConsumer<RegisterAsPersonCubit, RegisterAsPersonState>(
          listener: (context, state) {
            if (state is PersonRegisteredSuccess) {
              context.pop();
            }
            if (state is PersonRegisteredFailed) {
              UiHelper.showSnakBar(
                message: state.message,
                context: context,
                type: MotionToastType.error,
              );
            }
          },
          builder: (context, state) {
            final cubit = BlocProvider.of<RegisterAsPersonCubit>(context);
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
                          const ProfileImage(),
                          const CoreInformation(),
                          const CvViewInfo(),
                          const Studies(),
                          const WorkExperiances(),
                          const Cirtifications(),
                          const UserSkills(),
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
