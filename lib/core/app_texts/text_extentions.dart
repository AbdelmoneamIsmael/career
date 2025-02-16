import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension AppTextsExtensions on Text {
  Widget withPaddingLeft(num h) {
    return Padding(
      padding: EdgeInsets.only(left: h.w),
      child: this,
    );
  }

  Widget withPaddingright(num h) {
    return Padding(
      padding: EdgeInsets.only(right: h.w),
      child: this,
    );
  }

  Widget withPaddingTop(num h) {
    return Padding(
      padding: EdgeInsets.only(top: h.h),
      child: this,
    );
  }

  Widget withPaddingBottom(num h) {
    return Padding(
      padding: EdgeInsets.only(bottom: h.h),
      child: this,
    );
  }

  Widget withPaddingAll(num h) {
    return Padding(
      padding: EdgeInsets.all(h.toDouble()).w,
      child: this,
    );
  }

  Widget withPaddingHorizontal(num h) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: h.toDouble()).w,
      child: this,
    );
  }

  Widget withPaddingVirtical(num h) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: h.toDouble()).w,
      child: this,
    );
  }
}
