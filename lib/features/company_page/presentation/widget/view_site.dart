import 'package:career/core/themes/styles/app_text_style.dart';
import 'package:career/core/widgets/primary_container.dart';
import 'package:career/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewSite extends StatelessWidget {
  const ViewSite({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: PrimaryContainer(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        border: Border.all(color: Colors.blue),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        child: Row(
          children: [
            Text(
              'Visit website',
              style: AppTextStyle.bold16(context).copyWith(color: Colors.blue),
            ),
            10.horizontalSpace,
            Image.asset(
              Assets.images.exit.path,
              width: 14,
              color: Colors.blue,
            ),
            5.horizontalSpace,
          ],
        ),
      ),
    );
  }
}
