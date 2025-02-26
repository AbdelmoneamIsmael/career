import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:career/core/themes/styles/app_text_style.dart';

class AppTextFieldWithTitle extends StatelessWidget {
  const AppTextFieldWithTitle(
      {super.key,
      required this.title,
      required this.hint,
      this.scure = false,
      this.enabeld = true,
      this.readOnly = false,
      this.controller,
      this.validator,
      this.autofillHints,
      this.inputFormatters,
      this.keyboardType,
      this.maxLines = 1,
      this.fillColor,
      this.prefixIcon,
      this.suffixIcon});
  final String title, hint;
  final bool scure, enabeld, readOnly;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Iterable<String>? autofillHints;
  final List<TextInputFormatter>? inputFormatters;
  final Color? fillColor;
  final TextInputType? keyboardType;
  final int maxLines;
  final Widget? prefixIcon, suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: AppTextStyle.medium14h24(context),
            ),
            Text(
              "*",
              style: AppTextStyle.medium14h24(context).copyWith(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 13,
        ),
        AppTextField(
          hint: hint,
          scure: scure,
          enabeld: enabeld,
          readOnly: readOnly,
          controller: controller,
          validator: validator,
          autofillHints: autofillHints,
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          maxLines: maxLines,
        ),
      ],
    );
  }
}

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.hint,
    this.scure = false,
    this.enabeld = true,
    this.readOnly = false,
    this.controller,
    this.validator,
    this.autofillHints,
    this.inputFormatters,
    this.keyboardType,
    this.maxLines = 1,
    this.fillColor,
    this.prefixIcon,
    this.suffixIcon,
    this.withBorder = true,
    this.borderRadius,
    this.focusedBorder,
  });
  final String hint;
  final bool scure, enabeld, readOnly, withBorder;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Iterable<String>? autofillHints;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final int maxLines;
  final Color? fillColor;
  final Widget? prefixIcon, suffixIcon;
  final BorderRadius? borderRadius;
  final InputBorder? focusedBorder;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: scure,
      readOnly: readOnly,
      enabled: enabeld,
      validator: validator,
      autocorrect: true,
      autofillHints: autofillHints,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      maxLines: maxLines,
      textAlignVertical: TextAlignVertical.center,
      style: AppTextStyle.medium16h24(context).copyWith(
        height: 1,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 8.w,
          vertical: 6.h,
        ),
        isDense: false,
        hintStyle: AppTextStyle.regular14(context).copyWith(
          color: Theme.of(context).textTheme.bodySmall!.color,
        ),
        hintText: hint,
        focusedBorder: focusedBorder ??
            UnderlineInputBorder(
              borderSide: BorderSide(
                width: .8,
                color: withBorder
                    ? Theme.of(context).textTheme.bodyMedium!.color!
                    : Colors.transparent,
              ),
            ),
        filled: true,
        fillColor: fillColor ?? Colors.transparent,
        enabledBorder: focusedBorder ??
            UnderlineInputBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(0),
              borderSide: BorderSide(
                width: .8,
                color: withBorder
                    ? Theme.of(context).textTheme.bodySmall!.color!
                    : Colors.transparent,
              ),
            ),
        disabledBorder: focusedBorder ??
            UnderlineInputBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(0),
              borderSide: BorderSide(
                width: .8,
                color: withBorder
                    ? Theme.of(context).textTheme.bodySmall!.color!
                    : Colors.transparent,
              ),
            ),
        border: focusedBorder ??
            UnderlineInputBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(0),
              borderSide: BorderSide(
                width: .8,
                color: withBorder
                    ? Theme.of(context).textTheme.bodySmall!.color!
                    : Colors.transparent,
              ),
            ),
        errorBorder: focusedBorder ??
            UnderlineInputBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(0),
              borderSide: BorderSide(
                width: .8,
                color: Theme.of(context).colorScheme.error,
              ),
            ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
