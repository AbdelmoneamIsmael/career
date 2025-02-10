import 'package:career/core/themes/styles/app_text_style.dart';
import 'package:career/features/register_as_person/presentation/cubit/register_as_person_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.arrow_back_ios_rounded,
        size: 25.sp,
        color: Theme.of(context).textTheme.bodyMedium!.color,
      ),
      onTap: () {
        context.read<RegisterAsPersonCubit>().previous();
      },
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        textAlign: TextAlign.start,
        style: AppTextStyle.bold16(context).copyWith(
          textBaseline: TextBaseline.alphabetic,
          fontWeight: FontWeight.w700,
          fontSize: 20,
          height: 1,
        ),
      ),
    );
  }
}
