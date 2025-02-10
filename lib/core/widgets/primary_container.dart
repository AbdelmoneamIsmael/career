import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryContainer extends StatelessWidget {
  const PrimaryContainer({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.borderRadius,
  });
  final Widget child;
  final EdgeInsetsGeometry? padding, margin;
  final BorderRadiusGeometry? borderRadius;
  @override
  Widget build(BuildContext context) {
    return Container(
     padding: padding?? const EdgeInsets.all(20).w,
      margin:margin?? const EdgeInsets.all(22).w,
      decoration: BoxDecoration(
        borderRadius: borderRadius?? BorderRadius.circular(20.r),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: child,
    );
  }
}
