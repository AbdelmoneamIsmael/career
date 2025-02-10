import 'package:career/core/themes/styles/app_text_style.dart';
import 'package:career/gen/assets.gen.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppDropdown extends StatelessWidget {
  const AppDropdown(
      {super.key,
      required this.items,
      required this.onChanged,
      required this.hint});
  final List<DropdownMenuItem> items;
  final void Function(dynamic) onChanged;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2(
      isExpanded: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 8.w,
          vertical: 1.h,
        ),
        isDense: false,
        hintStyle: AppTextStyle.regular14(context).copyWith(
          color: Theme.of(context).textTheme.bodySmall!.color,
        ),
        hintText: hint,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              width: .8, color: Theme.of(context).textTheme.bodyMedium!.color!),
        ),
        filled: true,
        fillColor: Colors.transparent,
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(
              width: .8, color: Theme.of(context).textTheme.bodySmall!.color!),
        ),
        disabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(
              width: .8, color: Theme.of(context).textTheme.bodySmall!.color!),
        ),
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(
              width: .8, color: Theme.of(context).textTheme.bodySmall!.color!),
        ),
        errorBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(
            width: .8,
            color: Theme.of(context).colorScheme.error,
          ),
        ),
      ),
      hint: Text(
        hint,
        style: AppTextStyle.regular12(context).copyWith(
          fontSize: 14.sp,
          color: Theme.of(context).textTheme.bodySmall!.color,
          height: 1.4,
        ),
      ),
      iconStyleData: IconStyleData(
        icon: SvgPicture.asset(
          Assets.icons.chevronDown,
          fit: BoxFit.scaleDown,
          width: 24.w,
        ),
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
      ),
      style: AppTextStyle.medium16h24(context).copyWith(
        height: 1,
      ),
      validator: (value) => value == null ? 'Please enter $hint' : null,
      isDense: true,
      items: items,
      onChanged: onChanged,
    );
  }
}
