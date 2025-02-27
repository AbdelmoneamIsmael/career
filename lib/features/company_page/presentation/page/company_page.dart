import 'package:career/core/themes/colors/colors.dart';
import 'package:career/core/themes/styles/app_text_style.dart';
import 'package:career/core/widgets/custom_tap_container_button.dart';
import 'package:career/core/widgets/primary_container.dart';
import 'package:career/core/widgets/screen_wrapper.dart';
import 'package:career/features/company_page/presentation/manager/company_cubit.dart';
import 'package:career/features/company_page/presentation/manager/company_state.dart';
import 'package:career/features/company_page/presentation/widget/company_page_descriptive_data.dart';
import 'package:career/features/company_page/presentation/widget/company_page_image_and_background.dart';
import 'package:career/features/company_page/presentation/widget/view_site.dart';
import 'package:career/gen/assets.gen.dart';
// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompanyPage extends StatelessWidget {
  const CompanyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      topSafeArea: true,
      body: PrimaryContainer(
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        padding: const EdgeInsets.all(0),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CompanyPageImageAndBackground(),
            5.verticalSpace,
            const CompanyPageDescriptiveData(),
            10.verticalSpace,
            const ViewSite(),
            45.verticalSpace,
            Divider(
              color: Theme.of(context).textTheme.bodySmall!.color,
              thickness: 3,
              height: 3,
            ),
            5.verticalSpace,
            Expanded(
              child: BlocProvider(
                create: (context) => CompanyCubit(),
                child: const DefaultTabController(
                  length: 3,
                  child: CompanyPageSections(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CompanyPageSections extends StatelessWidget {
  const CompanyPageSections({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyCubit, CompanyState>(
      builder: (context, state) {
        return Column(
          children: [
            PrimaryContainer(
              margin: const EdgeInsets.all(0),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1), // Shadow color
                  spreadRadius: 2, // Spread radius
                  blurRadius: 8, // Blur radius
                  offset:
                      const Offset(0, -2), // Offset to create a shadow below
                ),
              ],
              child: CustomTapContainerButton(
                selectedIndex:
                    BlocProvider.of<CompanyCubit>(context).selectIndex,
                length: 3,
                tabTitles: [
                  'Home',
                  'About',
                  'Jobs',
                ],
                onTap: (index) {
                  context.read<CompanyCubit>().changeTap(index: index);
                  DefaultTabController.of(context).animateTo(index);
                },
              ),
            ),
            // 33.verticalSpace,
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  // Home
                  SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                        10,
                        (index) {
                          return CompanyPageHomeItem(
                            path: Assets.images.aramedia.path,
                            description:
                                'Aramco Digital, Armada, and Microsoft Collaborate to Deploy World’s First Industrial Distributed Cloud to Accelerate Digital Transformation',
                          );
                        },
                      ),
                    ),
                  ),
                  // About
                  const Column(
                    children: [
                      // CarouselSlider(
                      //   options: CarouselOptions(height: 400.0),
                      //   items: [1, 2, 3, 4, 5].map((i) {
                      //     return Builder(
                      //       builder: (BuildContext context) {
                      //         return Container(
                      //             width: MediaQuery.of(context).size.width,
                      //             margin: const EdgeInsets.symmetric(
                      //                 horizontal: 5.0),
                      //             decoration:
                      //                 const BoxDecoration(color: Colors.amber),
                      //             child: Text(
                      //               'text $i',
                      //               style: const TextStyle(fontSize: 16.0),
                      //             ));
                      //       },
                      //     );
                      //   }).toList(),
                      // ),
                    ],
                  ),
                  // Jobs
                  Container(child: const Text('data3')),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class CompanyPageHomeItem extends StatelessWidget {
  const CompanyPageHomeItem({
    super.key,
    required this.path,
    required this.description,
  });
  final String path, description;
  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      padding: const EdgeInsets.all(12),
      border: Border.all(color: LightColors.text2Color),
      borderRadius: BorderRadius.circular(8.r),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.asset(
                path,
                fit: BoxFit.cover,
              ),
            ),
          ),
          10.verticalSpace,
          Text(
            description,
            style: AppTextStyle.bold14h24(context),
          ),
        ],
      ),
    );
  }
}
