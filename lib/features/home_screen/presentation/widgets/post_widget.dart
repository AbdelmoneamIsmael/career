import 'package:career/core/app_texts/app_localizations.dart';
import 'package:career/core/routes/pages_keys.dart';
import 'package:career/core/themes/styles/app_text_style.dart';
import 'package:career/core/widgets/primary_container.dart';
import 'package:career/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      onPress: () {
        GoRouter.of(context).pushNamed(PagesKeys.postDetails);
      }
      ,
      margin: EdgeInsets.zero,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 12.w,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Image.asset(
                  Assets.images.profile.path,
                  height: 80.w,
                  width: 80.w,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Graphic Designer",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: AppTextStyle.bold16(context),
                    ),
                    Text(
                      "Almahd Technology •",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: AppTextStyle.regular12(context).copyWith(
                        color: Theme.of(context).textTheme.bodySmall!.color,
                      ),
                    ),
                    Text(
                      "12/12/2022 • 12 PM",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: AppTextStyle.regular12(context).copyWith(
                        color: Theme.of(context).textTheme.bodySmall!.color,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      "Experienced · 3+ Yrs of Exp · Creative/Design/Art · Marketing/PR/Advertising · Media/Journalism/Publishing· Adobe Photoshop· Graphic Design· illustrator· Motion Graphics· After Effects· Branding· Graphic",
                      style: AppTextStyle.regular14(context).copyWith(
                        color: Theme.of(context).textTheme.bodySmall!.color,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          const Divider(thickness: .5, color: Colors.grey),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                AppLocalizations.of(context).applyNow,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: AppTextStyle.bold16(context),
              ),
              const Spacer(),
              Row(
                children: [
                  Icon(
                    Icons.favorite,
                    size: 16,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(width: 5),
                  Text("1222",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: AppTextStyle.regular12(context).copyWith(
                        color: Theme.of(context).textTheme.bodySmall!.color,
                      )),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
