import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryContainer extends StatelessWidget {
  const PrimaryContainer({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.borderRadius,
    this.color,
    this.hight,
    this.width, this.boxShadow,
  });
  final Widget child;
  final EdgeInsetsGeometry? padding, margin;
  final BorderRadiusGeometry? borderRadius;
  final Color? color;
  final double? hight, width;
  final List<BoxShadow>? boxShadow;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(20).w,
      margin: margin ?? const EdgeInsets.all(22).w,
      height: hight,
      width: width,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(20.r),
        color: color ?? Theme.of(context).colorScheme.primaryContainer,
        boxShadow: boxShadow,
      ),
      child: child,
    );
  }
}
