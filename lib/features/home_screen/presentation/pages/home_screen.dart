import 'package:career/core/app_texts/app_localizations.dart';
import 'package:career/core/widgets/app_text_field.dart';
import 'package:career/core/widgets/screen_wrapper.dart';
import 'package:career/features/home_screen/presentation/widgets/post_widget.dart';
import 'package:career/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      backgroundImage: DecorationImage(
        image: AssetImage(
          Assets.images.homeScreen.path,
        ),
        fit: BoxFit.cover,
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
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
                )),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8).w,
            sliver: SliverList.separated(
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 16,
                );
              },
              itemCount: 10,
              itemBuilder: (context, index) {
                return const PostWidget();
              },
            ),
          ),
        ],
      ),
    );
  }
}
