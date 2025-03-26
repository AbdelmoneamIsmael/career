import 'package:career/core/app_texts/app_localizations.dart';
import 'package:career/core/widgets/app_svg.dart';
import 'package:career/core/widgets/app_text_field.dart';
import 'package:career/core/widgets/forward_widget.dart';
import 'package:career/core/widgets/primary_container.dart';
import 'package:career/core/widgets/title_widget.dart';
import 'package:career/core/widgets/ui_function.dart';
import 'package:career/features/register_as_business/presentation/manager/business_cubit.dart';
import 'package:career/features/register_as_business/presentation/manager/business_state.dart';
import 'package:career/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motion_toast/resources/arrays.dart';

class ComPanyInfo extends StatelessWidget {
  const ComPanyInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterAsBusinessCubit, RegisterBusinessState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<RegisterAsBusinessCubit>(context);
        return PrimaryContainer(
          child: Column(
            spacing: 16.h,
            children: [
              TitleWidget(
                title: AppLocalizations.of(context).communicationInfo,
                onTap: () => context.read<RegisterAsBusinessCubit>().previous(),
              ),
              const SizedBox(),
              AppTextField(
                controller: cubit.facebookUrlController,
                prefixIcon: const Icon(
                  Icons.facebook,
                ),
                hint: AppLocalizations.of(context).facebookUrl,
                keyboardType: TextInputType.url,
              ),
              AppTextField(
                controller: cubit.linkedInUrlrUrlController,
                keyboardType: TextInputType.url,
                prefixIcon: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: AppSvg(
                    path: Assets.icons.linkedIn,
                    width: 18.w,
                  ),
                ),
                hint: AppLocalizations.of(context).linkedinUrl,
              ),
              AppTextField(
                controller: cubit.webSiteUrlController,
                keyboardType: TextInputType.url,
                prefixIcon: const Icon(
                  Icons.language,
                ),
                hint: AppLocalizations.of(context).websiteUrl,
              ),
              AppTextField(
                controller: cubit.specializationController,
                hint: AppLocalizations.of(context).specialization,
                prefixIcon: const Icon(Icons.workspaces),
                suffixIcon: GestureDetector(
                  onTap: cubit.addSpecialization,
                  child: const Icon(Icons.check),
                ),
              ),
              Wrap(
                spacing: 8.w,
                children: cubit.registerModel.scope
                    .map(
                      (e) => Chip(
                        label: Text(e),
                        onDeleted: () => cubit.deleteSpecialization(e),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(),
              ForwardWidget(
                onPressed: () {
                  if (cubit.communicationInformationValid()) {
                    context.read<RegisterAsBusinessCubit>().next();
                  } else {
                    UiHelper.showSnakBar(
                      context: context,
                      message:
                          AppLocalizations.of(context).youShouldFillAllFields,
                      type: MotionToastType.info,
                    );
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
