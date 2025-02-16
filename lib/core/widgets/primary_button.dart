import 'package:flutter/material.dart';
import 'package:career/core/widgets/loading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.loading = false,
    this.onSecondaryTap,
    this.fixedSize = true,
  });
  final String text;
  final VoidCallback? onPressed, onSecondaryTap;
  final bool loading;
  final bool fixedSize;

  @override
  Widget build(BuildContext context) {
    return loading
        ? ElevatedButton(
            onPressed: () {},
            child: const LoadingWidget(
              color: Colors.white,
              loadingSize: 24,
            ),
          )
        : InkWell(
            onSecondaryTap: onSecondaryTap,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: fixedSize ? Size.fromHeight(49.h) : null,
              ),
              onPressed: onPressed,
              child: Text(
                text,
              ),
            ),
          );
  }
}
