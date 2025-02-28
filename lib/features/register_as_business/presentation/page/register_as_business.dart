import 'dart:ui';
import 'package:career/core/app_texts/app_localizations.dart';
import 'package:career/core/widgets/app_contry_code_picker.dart';
import 'package:career/core/widgets/app_drop_down.dart';
import 'package:career/core/widgets/app_text_field.dart';
import 'package:career/core/widgets/forward_widget.dart';
import 'package:career/core/widgets/primary_container.dart';
import 'package:career/core/widgets/screen_wrapper.dart';
import 'package:career/core/widgets/title_widget.dart';
import 'package:career/features/register_as_business/presentation/manager/business_cubit.dart';
import 'package:career/features/register_as_business/presentation/manager/business_state.dart';
import 'package:career/features/register_as_business/presentation/view/company_image.dart';
import 'package:career/features/register_as_business/presentation/view/company_info.dart';
import 'package:career/features/register_as_business/presentation/view/company_language.dart';
import 'package:career/gen/assets.gen.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RegisterAsBusiness extends StatelessWidget {
  const RegisterAsBusiness({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterAsBusinessCubit(),
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
            // TODO: implement listener
          },
          builder: (context, state) {
            final cubit = BlocProvider.of<RegisterAsBusinessCubit>(context);
            return CustomScrollView(
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
                      // const Studies(),
                      // const WorkExperiances(),
                      // const UserSkills(),
                      // const Cirtifications(),
                      const CompanyLanguage(),
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

class BusinessCoreInformation extends StatelessWidget {
  const BusinessCoreInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      child: Column(
        spacing: 16.h,
        children: [
          TitleWidget(
            title: AppLocalizations.of(context).coreInfo,
            onTap: () => context.read<RegisterAsBusinessCubit>().previous(),
          ),
          const SizedBox(),
          AppTextField(
            hint: AppLocalizations.of(context).fullName,
            prefixIcon: const Icon(
              Icons.home_work_outlined,
            ),
          ),
          AppTextField(
            hint: AppLocalizations.of(context).email,
            prefixIcon: const Icon(
              Icons.email,
            ),
          ),
          AppTextField(
            hint: AppLocalizations.of(context).phone,
            prefixIcon: const CountryCodePrefixIcon(),
          ),
          AppTextField(
            hint: AppLocalizations.of(context).password,
            prefixIcon: const Icon(
              Icons.lock,
            ),
            scure: true,
          ),
          AppTextField(
            hint: AppLocalizations.of(context).dateOfCreate,
            prefixIcon: const Icon(
              Icons.date_range_outlined,
            ),
          ),
          AppDropdown(
            prefixIcon: const Icon(
              Icons.flag,
            ),
            items: [],
            onChanged: (value) {},
            hint: AppLocalizations.of(context).nationality,
          ),
          const SizedBox(),
          ForwardWidget(
            onPressed: () => context.read<RegisterAsBusinessCubit>().next(),
          ),
        ],
      ),
    );
  }
}
