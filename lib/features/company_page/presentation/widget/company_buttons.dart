import 'package:career/core/themes/colors/colors.dart';
import 'package:career/core/themes/styles/app_text_style.dart';
import 'package:career/core/widgets/primary_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompanyButtons extends StatefulWidget {
  const CompanyButtons({
    super.key,
  });

  static const List<String> status = ['Home', 'About', 'Jobs'];

  @override
  State<CompanyButtons> createState() => _CompanyButtonsState();
}

class _CompanyButtonsState extends State<CompanyButtons> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      padding: EdgeInsets.symmetric(horizontal: 12.w)
          .copyWith(top: 15, bottom: 22.h),
      borderRadius: BorderRadius.circular(8.r),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.1), // Shadow color
          spreadRadius: 2, // Spread radius
          blurRadius: 8, // Blur radius
          offset: const Offset(0, -2), // Offset to create a shadow below
        ),
      ],
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: 15,
        children: List.generate(
          CompanyButtons.status.length,
          (index) {
            return CupertinoButton(
              padding: EdgeInsets.zero,
              minSize: 0,
              onPressed: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Text(
                CompanyButtons.status[index],
                style: AppTextStyle.bold14h24(context).copyWith(
                    color: selectedIndex == index
                        ? LightColors.buttonColor
                        : LightColors.textColor,
                    fontWeight: FontWeight.w400),
              ),
            );
          },
        ),
      ),
    );
  }
}
