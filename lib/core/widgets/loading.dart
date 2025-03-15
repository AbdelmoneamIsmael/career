import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.color, this.loadingSize});
  final Color? color;
  final double? loadingSize;
  @override
  Widget build(BuildContext context) {
    return SpinKitChasingDots(
      color: color ?? Theme.of(context).colorScheme.primary,
      size: loadingSize ?? 24.sp,
    );
  }
}
