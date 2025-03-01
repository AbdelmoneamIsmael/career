import 'package:career/core/app_texts/app_localizations.dart';
import 'package:career/core/widgets/forward_widget.dart';
import 'package:career/core/widgets/primary_container.dart';
import 'package:career/core/widgets/title_widget.dart';
import 'package:career/features/register_as_business/presentation/manager/business_cubit.dart';
import 'package:career/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompanyImage extends StatelessWidget {
  const CompanyImage({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16.h,
        children: [
          TitleWidget(
            title: AppLocalizations.of(context).company,
            onTap: () => context.read<RegisterAsBusinessCubit>().next()
          ),
          const SizedBox(),
          const SizedBox(),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(200.r),
              child: Image.asset(
                Assets.images.companyImage.path,
                width: 200.w,
                height: 200.w,
                fit: BoxFit.cover,
                alignment: const Alignment(
                  .5,
                  0,
                ),
              ),
            ),
          ),
          const SizedBox(),
          const SizedBox(),
            ForwardWidget(
            onPressed: () => context.read<RegisterAsBusinessCubit>().next(),
          ),
        ],
      ),
    );
  }
}
