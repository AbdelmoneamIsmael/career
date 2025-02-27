import 'package:career/core/themes/colors/colors.dart';
import 'package:career/core/themes/styles/app_text_style.dart';
import 'package:career/core/widgets/primary_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompanyPageHomeItem extends StatelessWidget {
  const CompanyPageHomeItem({
    super.key,
    required this.path,
    required this.description,
  });
  final String path, description;
  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      padding: const EdgeInsets.all(12),
      border: Border.all(color: LightColors.text2Color),
      borderRadius: BorderRadius.circular(8.r),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.asset(
                path,
                fit: BoxFit.cover,
              ),
            ),
          ),
          10.verticalSpace,
          Text(
            description,
            style: AppTextStyle.bold14h24(context),
          ),
        ],
      ),
    );
  }
}
