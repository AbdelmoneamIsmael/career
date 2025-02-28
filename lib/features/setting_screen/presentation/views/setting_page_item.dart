import 'package:career/core/themes/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingPageItem extends StatelessWidget {
  const SettingPageItem({
    super.key,
    required this.title,
    this.child,
    required this.path,
    this.onTab,
  });
  final String title, path;
  final Widget? child;
  final VoidCallback? onTab;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  path,
                  fit: BoxFit.scaleDown,
                  width: 20.w,
                  height: 20.h,
                  color: Theme.of(context).colorScheme.shadow,
                ),
                15.horizontalSpace,
                Text(title, style: AppTextStyle.bold16(context)),
              ],
            ),
            child ??
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
          ],
        ),
      ),
    );
  }
}
