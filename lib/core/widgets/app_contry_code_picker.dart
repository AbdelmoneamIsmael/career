import 'package:career/core/themes/styles/app_text_style.dart';
import 'package:career/gen/assets.gen.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CountryCodePrefixIcon extends StatelessWidget {
  const CountryCodePrefixIcon({super.key, this.onChanged});
  final void Function(CountryCode)? onChanged;

  @override
  Widget build(BuildContext context) {
    return CountryCodePicker(
      onChanged: onChanged,
      initialSelection: 'Iq',
      favorite: ['+964', 'Iq'],
      showCountryOnly: false,
      showOnlyCountryWhenClosed: false,
      alignLeft: false,
      flagWidth: 24.w,
      flagHeight: 15.h,
      dialogTextStyle: AppTextStyle.bold16(context).copyWith(
        fontSize: 14.sp,
        height: 1.42,
        color: Theme.of(context).textTheme.bodySmall!.color,
      ),
      dialogBackgroundColor: Theme.of(context).colorScheme.primaryContainer,
      textStyle: AppTextStyle.bold16(context).copyWith(
        fontSize: 14.sp,
        height: 1.42,
        color: Theme.of(context).textTheme.bodySmall!.color,
      ),
      dropDownWidget: Padding(
        padding: const EdgeInsets.all(6.0).w,
        child: SvgPicture.asset(Assets.icons.chevronDown),
      ),
      showDropDownButton: true,
      showFlag: true,
      margin: EdgeInsets.only(right: 8.w),
      padding: EdgeInsets.zero,
      flagDecoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4.r)),
      ),
    );
  }
}
