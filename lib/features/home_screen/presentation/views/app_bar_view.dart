import 'package:career/core/app_texts/app_localizations.dart';
import 'package:career/core/widgets/app_text_field.dart';
import 'package:career/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppBarView extends StatelessWidget {
  const AppBarView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      pinned: false,
      floating: true,
      scrolledUnderElevation: 0,
      toolbarHeight: 70.h,
      title: AppTextField(
        hint: AppLocalizations.of(context).searchHint,
        suffixIcon: SvgPicture.asset(
          Assets.icons.fillterIcon,
          fit: BoxFit.scaleDown,
          colorFilter: ColorFilter.mode(
            Theme.of(context).textTheme.bodyMedium!.color!,
            BlendMode.srcIn,
          ),
        ),
        prefixIcon: SvgPicture.asset(
          Assets.icons.searchIcon,
          fit: BoxFit.scaleDown,
          colorFilter: ColorFilter.mode(
            Theme.of(context).textTheme.bodyMedium!.color!,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
