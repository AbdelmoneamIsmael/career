import 'package:career/core/themes/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class DescriptiveItem extends StatelessWidget {
  const DescriptiveItem({
    super.key,
    required this.title,
    required this.description,
  });
  final String title, description;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.bold16(context),
        ),
        Text(
          description,
          style: AppTextStyle.regular14(context),
        ),
      ],
    );
  }
}
