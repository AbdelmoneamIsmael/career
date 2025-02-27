import 'package:career/core/routes/pages_keys.dart';
import 'package:career/core/themes/styles/app_text_style.dart';
import 'package:career/gen/assets.gen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CompanyJobsView extends StatelessWidget {
  const CompanyJobsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          30.verticalSpace,
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 30.0),
            child: Text(
              'Recently posted jobs',
              style: AppTextStyle.bold16(context),
            ),
          ),
          20.verticalSpace,
          CarouselSlider(
            options: CarouselOptions(
              // height: 400.0,
              autoPlayCurve: Curves.easeIn,
              aspectRatio: 1.4,
              enlargeCenterPage: true,
              enlargeFactor: 0.2,
            ),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(6.0),
                      ),
                      border: Border.all(
                        color: Theme.of(context).disabledColor,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            Assets.images.companyImage.path,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          10.verticalSpace,
                          Text(
                            'Flutter Developer',
                            style: AppTextStyle.bold16(context),
                          ),
                          5.verticalSpace,
                          Text(
                            'aramco',
                            style: AppTextStyle.regular14(context),
                          ),
                          5.verticalSpace,
                          Text(
                            'iraq',
                            style: AppTextStyle.regular14(context),
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CupertinoButton(
                                padding: EdgeInsets.zero,
                                minSize: 0,
                                onPressed: () => GoRouter.of(context)
                                    .pushNamed(PagesKeys.candidatesPage),
                                child: Text(
                                  'candidate',
                                  style:
                                      AppTextStyle.simiBold16(context).copyWith(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.blue,
                                    decorationThickness: 30,
                                  ),
                                ),
                              ),
                              Text(
                                '3 weeks ago',
                                style: AppTextStyle.regular14(context),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
