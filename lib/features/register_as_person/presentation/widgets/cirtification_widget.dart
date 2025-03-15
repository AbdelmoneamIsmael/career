import 'package:career/core/themes/styles/app_text_style.dart';
import 'package:career/features/register_as_person/domain/entities/register_input_model.dart';
import 'package:career/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CirtificationsWidget extends StatelessWidget {
  const CirtificationsWidget({super.key, required this.certification});
  final Certification certification;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          Assets.icons.cirtificate,
          colorFilter: ColorFilter.mode(
              Theme.of(context).textTheme.bodyMedium!.color!, BlendMode.srcIn),
        ),
        const SizedBox(width: 10),
        Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${certification.name!} ( ${certification.given!} )",
                style: AppTextStyle.simiBold18(context)),
            Text(certification.given!, style: AppTextStyle.regular12(context)),
          ],
        ),
      ],
    );
  }
}
