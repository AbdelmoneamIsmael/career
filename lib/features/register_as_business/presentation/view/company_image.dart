import 'package:career/core/app_texts/app_localizations.dart';
import 'package:career/core/widgets/forward_widget.dart';
import 'package:career/core/widgets/primary_container.dart';
import 'package:career/core/widgets/title_widget.dart';
import 'package:career/features/register_as_business/presentation/manager/business_cubit.dart';
import 'package:career/features/register_as_business/presentation/manager/business_state.dart';
import 'package:career/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompanyImage extends StatelessWidget {
  const CompanyImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterAsBusinessCubit, RegisterBusinessState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<RegisterAsBusinessCubit>(context);
        return PrimaryContainer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16.h,
            children: [
              TitleWidget(
                  title: AppLocalizations.of(context).company,
                  onTap: () => context.read<RegisterAsBusinessCubit>().next()),
              const SizedBox(),
              const SizedBox(),
              Center(
                child: Stack(
                  children: [
                    ClipRRect(
                      
                      borderRadius: BorderRadius.circular(200.r),
                      child: cubit.registerModel.image != null
                          ? Image.file(
                              cubit.registerModel.image!,
                              width: 200.w,
                              height: 200.w,
                              fit: BoxFit.cover,
                              alignment: const Alignment(
                                .5,
                                0,
                              ),
                            )
                          : Image.asset(
                              Assets.images.companyDefault.path,
                            ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: CircleAvatar(
                        radius: 30.r,
                        backgroundColor:
                            Theme.of(context).colorScheme.primaryContainer,
                        child: IconButton(
                          icon: Icon(
                            Icons.camera_alt_outlined,
                            color:
                                Theme.of(context).textTheme.bodyMedium!.color,
                          ),
                          onPressed: cubit.pickImage,
                        ),
                      ),
                    ),
                  ],
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
      },
    );
  }
}
