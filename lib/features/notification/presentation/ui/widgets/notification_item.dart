import 'package:career/core/themes/styles/app_text_style.dart';
import 'package:career/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.notifyData,
  });
  final String notifyData;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 16),
      padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 17.h),
      decoration: ShapeDecoration(
        color: Theme.of(context).textTheme.bodySmall!.color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(Assets.icons.notification, fit: BoxFit.scaleDown),
          15.horizontalSpace,
          Text(
            notifyData,
            style: AppTextStyle.regular12(context),
          ),
        ],
      ),
    );
  }
}
