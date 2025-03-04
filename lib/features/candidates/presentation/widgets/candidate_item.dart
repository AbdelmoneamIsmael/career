import 'package:career/core/themes/styles/app_text_style.dart';
import 'package:career/core/widgets/primary_container.dart';
import 'package:career/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CandidateItem extends StatelessWidget {
  const CandidateItem({
    super.key,
    this.isPremium = false,
    required this.name,
    required this.jobDescription,
  });
  final bool isPremium;
  final String name, jobDescription;
  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          10.verticalSpace,
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(200.r),
                child: Image.asset(
                  Assets.images.profile.path,
                  width: 50.w,
                  height: 50.h,
                  fit: BoxFit.cover,
                ),
              ),
              10.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          name,
                          style: AppTextStyle.bold16(context),
                        ),
                        if (isPremium)
                          Image.asset(
                            Assets.images.premiumBadge.path,
                            fit: BoxFit.scaleDown,
                            color: Colors.yellow,
                            width: 20.w,
                            height: 20.w,
                          ),
                      ],
                    ),
                    Text(
                      jobDescription,
                      style: AppTextStyle.regular12(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
          10.verticalSpace,
        ],
      ),
    );
  }
}
