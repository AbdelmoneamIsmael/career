import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSvg extends StatelessWidget {
  const AppSvg(
      {super.key,
      required this.path,
      this.color,
      this.height,
      this.width,
      this.fit = BoxFit.scaleDown,});
  final String path;
  final BoxFit fit;
  final Color? color;
  final double? height, width;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      fit: fit,
      
      colorFilter: color != null
          ? ColorFilter.mode(color!, BlendMode.srcIn)
          : ColorFilter.mode(
              Theme.of(context).textTheme.bodyMedium!.color!, BlendMode.srcIn),
      height: height,
      width: width,
    );
  }
}
