import 'package:career/core/routes/pages_keys.dart';
import 'package:career/core/themes/colors/colors.dart';
import 'package:career/core/themes/styles/app_text_style.dart';
import 'package:career/core/widgets/primary_container.dart';
import 'package:career/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.notifyData,
    this.isFirst = true,
    required this.isRead,
  });
  final String notifyData;
  final bool isFirst;
  final bool isRead;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).pushNamed(PagesKeys.companyPage);
      },
      child: PrimaryContainer(
        color: isRead
            ? Colors.transparent
            // .withValues(alpha: 0.8)
            : null,
        margin: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 0),
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 16),
        borderRadius: isFirst
            ? const BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16))
            : const BorderRadius.all(Radius.circular(0)),
        border: Border.all(color: LightColors.text2Color),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 4.0,
            offset: const Offset(0, 4),
          ),
        ],
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 4,
                  backgroundColor: LightColors.text2Color,
                ),
                15.horizontalSpace,
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Image.asset(
                    Assets.images.profileImage.path,
                    height: 40.w,
                    width: 40.w,
                    fit: BoxFit.cover,
                  ),
                ),
                15.horizontalSpace,
                Text(
                  notifyData,
                  style: AppTextStyle.regular12(context),
                ),
              ],
            ),
            const Text('1d'),
          ],
        ),
      ),
    );
  }
}
