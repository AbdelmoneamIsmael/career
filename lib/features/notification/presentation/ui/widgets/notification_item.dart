import 'package:career/core/themes/styles/app_text_style.dart';
import 'package:career/core/widgets/primary_container.dart';
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
    return PrimaryContainer(
      margin: const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 15),
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.25),
          blurRadius: 4,
          offset: const Offset(0, 4),
        ),
      ],
      child: Row(
        children: [
          Stack(
            children: [
              SvgPicture.asset(Assets.icons.notification,
                  fit: BoxFit.scaleDown),
              const CircleAvatar(
                radius: 5,
                backgroundColor: Colors.green,
              )
            ],
          ),
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
